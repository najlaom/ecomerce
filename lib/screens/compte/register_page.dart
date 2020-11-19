import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ecomerce/screens/screen.dart';
import 'package:ecomerce/services/NetworkHandler.dart';
import 'package:logger/logger.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController prenomController =TextEditingController();
  TextEditingController nomController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController paswwordController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController phone2Controller =TextEditingController();
  TextEditingController villeController =TextEditingController();
  TextEditingController regionController =TextEditingController();
  TextEditingController adresseController =TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();
  bool isEnabled = false;
  final Color divider = Colors.black;
  bool vis =true;
  bool validate =false;
  String errorText;
 String errorPassText;
  bool circular = false;
  var log = Logger();
  NetworkHandler networkHandler = NetworkHandler();
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
        title: Text('Créer un compte'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Créer un nouveau compte',
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
                      child: TextFormField(
                        // controller: _textFieldController,
                        controller: prenomController,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ prénom est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Prénom",
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextFormField(
                        // controller: _textFieldController,
                        controller: nomController,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ nom est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Nom",
                          //add icon outside input field
                          icon: Icon(Icons.person_outlined ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: emailController,
                        // controller: _textFieldController,
                        decoration: InputDecoration(
                          errorText: validate?null:errorText,
                          hintText: "Email",
                          //add icon outside input field
                          icon: Icon(Icons.mail_outline),

                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 20.0, right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: paswwordController,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ mot de passe est vide";
                            //user name unique

                          }
                          return null;
                        },
                        obscureText: vis,

                        // controller: _textFieldController,
                        decoration: InputDecoration(
                          helperText: "mot de passe comporte de 4 à 8 caractères",
                          helperStyle: TextStyle(
                            fontSize: 16
                          ),
                          hintText: "Mot de passe",
                          //add icon outside input field
                          icon: Icon(Icons.lock_open_sharp),
                          suffixIcon: IconButton(icon: Icon(vis ? Icons.visibility_off : Icons.visibility),onPressed: (){
                            setState(() {
                              vis = !vis;
                            });
                          },),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 20.0, right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: phoneController,
                          keyboardType: TextInputType.number,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ phone est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          icon: Icon(Icons.phone)
                        ),

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: phone2Controller,
                        keyboardType: TextInputType.number,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ phone 2 est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone Number 2',
                            icon: Icon(Icons.phone)
                        ),


                      ),
                    ),


                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: villeController,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ ville est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Ville",
                          //add icon outside input field
                          icon: Icon(Icons.person_pin_circle_outlined),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 50.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: regionController,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ region est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Region",
                          //add icon outside input field
                          icon: Icon(Icons.person_pin_circle_outlined ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextFormField(
                        controller: adresseController,
                        validator:(value){
                          if(value.isEmpty){
                            return "le champ adresse est vide";
                            //user name unique

                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Adresse",
                          //add icon outside input field
                          icon: Icon(Icons.house),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.orangeAccent,

                        onPressed: () async {
                          setState(() {
                            circular=true;
                          });
                          await checkUser();
                          if(_formKey.currentState.validate() && validate){
                            Map<String,String>data={
                              "email":emailController.text,
                              "password":paswwordController.text,
                              "phone":phoneController.text,
                              "nom" : nomController.text,
                              "prenom":prenomController.text,
                              "ville":villeController.text,
                              "region" : regionController.text,
                              "phoneTwo":phone2Controller.text,
                              "adress":adresseController.text,

                            };
                            //  print(data);

                            //networkHandler.get("api/products/getAll");
                            await  networkHandler.post("api/users/singUp", data);
                            setState(() {
                              circular=false;
                            });
                            /*    Navigator.push(context, MaterialPageRoute(builder: (_) => Compte()));*/
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Compte()), (route) => false);

                          }else{
                            setState(() {
                              circular =false;
                            });
                          }



                        },
                        child:circular? CircularProgressIndicator() :Container(
                          width: 150,
                          height: 30,
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                         // margin: EdgeInsets.all(20),

                          child: Center(
                            child: Text(
                              "Créer",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'JosefinSans',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),

                        )
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
      if(response['status']){
        setState(() {
       //   circular=false;
          validate =false;
          errorText ="email dija utilisé ";
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
        errorPassText ="Le champ email est vide";

      });
    }else{


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
