import 'package:ecomerce/screens/screen.dart';
import 'package:ecomerce/services/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  bool isEnabled = true;
  final Color divider = Colors.black;
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
                      child: TextField(
                        controller: prenomController,
                        decoration: InputDecoration(
                          hintText: "Prénom",
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextField(
                        controller: nomController,
                        decoration: InputDecoration(
                          hintText: "Nom",
                          //add icon outside input field
                          icon: Icon(Icons.person_outlined ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextField(
                         controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          //add icon outside input field
                          icon: Icon(Icons.mail_outline),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextField(
                         controller: paswwordController,
                        obscureText: true,
                        decoration: InputDecoration(

                          hintText: "Mot de passe",
                          //add icon outside input field
                          icon: Icon(Icons.lock_open_sharp),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: IntlPhoneField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: IntlPhoneField(
                        controller: phone2Controller,
                        decoration: InputDecoration(
                          labelText: 'Phone Number 2',
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },

                      ),
                    ),


                    Container(
                      padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
                      width: 400,
                      child: TextField(
                        controller: villeController,
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
                      child: TextField(
                        controller: regionController,
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
                      child: TextField(
                        controller: adresseController,
                        decoration: InputDecoration(
                          hintText: "Adresse",
                          //add icon outside input field
                          icon: Icon(Icons.house),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: FlatButton(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.orangeAccent,

                        onPressed: () async {


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
                          print(data);

                        //networkHandler.get("api/products/getAll");
                        await  networkHandler.post("api/users/singUp", data);
                      /*    Navigator.push(
                              context, MaterialPageRoute(builder: (_) => Compte()));*/
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Compte()), (route) => false);
                        },
                        child: Text(
                          "Créer",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
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

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
