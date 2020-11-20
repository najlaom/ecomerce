import 'dart:convert';

import 'package:ecomerce/main_navigation.dart';
import 'package:ecomerce/screens/compte/compte.dart';
import 'package:ecomerce/screens/compte/register_page.dart';
import 'package:ecomerce/services/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isEnabled = true;
  bool validate =false;
  bool validatePass =false;
  String errorText;
  String errorTextPass;
  bool circular = false;
  var log = Logger();
  final Color divider = Colors.black;
  TextEditingController emailController =TextEditingController();
  TextEditingController paswwordController =TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();
  final storage = new FlutterSecureStorage();
  enableButton() {
    setState(() {
      isEnabled = true;
    });
  }

  disableButton() {
    setState(() {
      isEnabled = false;
    });
  }

  sampleFunction() {
    print('Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        title: Text('Connectez-vous'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Identifiez-vous',
                style: TextStyle(
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    height: 1.5,
                    color: Colors.grey),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      width: 400,
                      child: TextField(
                        // controller: _textFieldController,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorText: validate?null:errorText,
                          //add icon outside input field
                          icon: Icon(Icons.mail_outline),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      width: 400,
                      child: TextField(
                        // controller: _textFieldController,
                        controller: paswwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Mot de passe",
                          errorText: validatePass?null:errorTextPass,
                          //add icon outside input field
                          icon: Icon(Icons.lock_open_sharp),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'MOT DE PASSE OUBLIE ?',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                            color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.orangeAccent,
                        onPressed: () async {
                          await checkUser();
                          await checkPass();
                          if(_formKey.currentState.validate() && validate && validatePass){
                          Map<String,String>data={
                            "email":emailController.text,
                            "password":paswwordController.text,

                          };
                          print(data);

                          //networkHandler.get("api/products/getAll");
                          var response=  await networkHandler.post("api/users/login", data);
                          if(response.statusCode == 200||response.statusCode == 201){
                            Map<String,dynamic> output = json.decode(response.body);
                            log.i("hereeee");
                            log.i(output);
                            print(output['token']);
                            await storage.write(key: "token", value: output['token']);

                            var res = await networkHandler.postToken("api/paniers/new", output['token']);
                            if(res.statusCode == 200||res.statusCode == 201){
                              Map<String,dynamic> panier = json.decode(res.body);
                              log.i(panier['token']);
                              await storage.write(key: "tokenPan", value: panier['token']);

                            }



                            /*  Navigator.push(
                                context, MaterialPageRoute(builder: (_) => Compte())); */

                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MainNavigation(par: 2,)), (route) => false);


                          }



                          }},
                        child: Text(
                          "Connectez-vous",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Nouveau Compte ?',
                            style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterPage())),
                            child: Text(
                              'CREER UN COMPTE ?',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 160,
                            child: Divider(),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            child: Text('OU'),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            width: 160,
                            child: Divider(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Text('f',
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade700,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              alignment: Alignment.center,
                              color: Colors.lightBlue,
                              iconSize: 40.0,
                            ),
                            Text(
                              "Continuer avec facebook",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                  radius: (10),
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: Image.asset('assets/gmail.png'),
                                  )),
                              alignment: Alignment.center,
                              color: Colors.lightBlue,
                              iconSize: 40.0,
                            ),
                            Text(
                              "Continuer avec gmail",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
  checkUser()async{
    if(emailController.text.length == 0){
      setState(() {
        //  circular=false;
        validate =false;
        errorText ="Le champ email est vide";

      });
    }else if(!isEmail(emailController.text)){
      setState(() {
        //  circular=false;
        validate =false;
        errorText ="invalide email";
        log.i(isEmail(emailController.text));

      });

    }
    else{
      var response = await networkHandler.get("api/users/checkUser/${emailController.text}");
      if(!response['status']){
        setState(() {
          //   circular=false;
          validate =false;
          errorText ="compte introuvable ";
          log.i(isEmail(emailController.text));

        });
      }else{
        validate =true;
      }
    }

  }
  checkPass() async{
    if(paswwordController.text.length == 0){
      setState(() {
        //  circular=false;
        validate =false;
        errorTextPass ="Le champ password est vide";

      });
    }else{
      Map<String,String>data={
        "email":emailController.text,
        "password":paswwordController.text,

      };
      var response = await networkHandler.post("api/users/checkPass",data);
      var output = json.decode(response.body);
      if(!output['status']){
        setState(() {
          //   circular=false;
          validatePass =false;
          errorTextPass ="mot de passe incorrectte ! ";


        });
      }else{
        validatePass =true;
      }


    }

  }
  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
