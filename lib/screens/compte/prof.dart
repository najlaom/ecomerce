import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ecomerce/screens/screen.dart';
import 'package:ecomerce/services/NetworkHandler.dart';
import 'package:logger/logger.dart';
import 'package:ecomerce/main_navigation.dart';

class Prof extends StatefulWidget{

    @override
  _ProfState createState() => _ProfState();


}

class _ProfState extends State<Prof> {
  TextEditingController prenomController =TextEditingController();
  TextEditingController nomController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  TextEditingController phone2Controller =TextEditingController();
  TextEditingController villeController =TextEditingController();
  TextEditingController regionController =TextEditingController();
  TextEditingController adresseController =TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  bool isEnabled = false;
  bool vis =true;
  //bool validate =false;
  bool loading = true;
  final storage = new FlutterSecureStorage();
  String errorText;

  bool circular = false;
  var log = Logger();
  final Color divider = Colors.black;
  NetworkHandler networkHandler = NetworkHandler();

  void _loadData() async{

    String value =  await storage.read(key: "token");
    var response = await networkHandler.getUser("api/users/getUserById",value);
    var user = response['user'];
    var prenom = user['prenom'];
    var email = user['email'];
    var nom = user['nom'];
    var adress = user['adress'];
    var phone = user['phone'];
    var phoneTwo = user['phoneTwo'];
    var region = user['region'];
    var ville = user['ville'];
    setState(() {
      prenomController.text= prenom;
      emailController.text =email;
      nomController.text =nom;
      //log.i(ville);
      adresseController.text =adress;
      phoneController.text =phone.toString();
      phone2Controller.text =phoneTwo.toString();
      regionController.text =region;
      villeController.text =ville;
    });
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      loading = false;
    });

  }

  @override
  void initState() {
    _loadData();


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.black87,
       title: Text('Profile'),

     ),
     body:  SingleChildScrollView(
       child: Form(

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
                     labelText: "Prénom",
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
                     labelText: "Nom",
                     //add icon outside input field
                     icon: Icon(Icons.person_outlined ),
                   ),
                 ),
               ),
               Container(
                 padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                 width: 400,
                 child: TextFormField(
                   readOnly: true,
                   controller: emailController,
                   // controller: _textFieldController,
                   decoration: InputDecoration(
                     labelText: "Email",
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
                     labelText: "Ville",
                     //add icon outside input field
                     icon: Icon(Icons.person_pin_circle_outlined),
                   ),
                 ),
               ),

               Container(
                 padding: EdgeInsets.only(bottom: 20.0, left: 20.0,right: 20.0),
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
                     labelText: "Region",
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
                     labelText: "Adresse",
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
              //       await checkUser();
                     if(_formKey.currentState.validate() ){
                       Map<String,String>data={
                         "phone":phoneController.text,
                         "nom" : nomController.text,
                         "prenom":prenomController.text,
                         "ville":villeController.text,
                         "region" : regionController.text,
                         "phoneTwo":phone2Controller.text,
                         "adress":adresseController.text,

                       };
                       //  print(data);
                       String value =  await storage.read(key: "token");

                       //networkHandler.get("api/products/getAll");
                       await  networkHandler.put("api/users/updateProfile", data,value);
                       setState(() {
                         circular=false;
                       });
                       /*    Navigator.push(context, MaterialPageRoute(builder: (_) => Compte()));*/
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>  MainNavigation(par: 2,)), (route) => false);

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
                         "Sauvegarder",
                         style: TextStyle(
                           fontSize: 18,
                           fontFamily: 'JosefinSans',
                           fontWeight: FontWeight.w400,
                           height: 1.5,
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           )
       ),
     ),
   );
  }
}