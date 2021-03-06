import 'package:ecomerce/screens/compte/login_page.dart';
import 'package:ecomerce/screens/compte/prof.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:ecomerce/services/NetworkHandler.dart';
import 'dart:convert';

import '../../main_navigation.dart';

class Compte extends StatefulWidget {
  const Compte({
    Key key,
  }) : super(key: key);
  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  bool connected = false;
  bool loading = true;
  final Color divider = Colors.grey.shade600;
  final storage = new FlutterSecureStorage();
  NetworkHandler networkHandler = NetworkHandler();
  String bonjour="Bonjour!";
  String connecter="Connectez-vous";

  var log = Logger();

  void _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
    //nidh
    String value =  await storage.read(key: "token");

    //  String value =  await storage.read(key: "token");
    // log.i(value);
    if(value == null){

      setState(() {
        bonjour="Bonjour!";
        connected =false;
        connecter="Connectez-vous";
      });
    }else{



      var response = await networkHandler.getUser("api/users/getUserById",value);
      var user = response['user'];
      var prenom = user['prenom'];
      prenom =capitalize(prenom);


     // var nom =user['moumen'];
      setState(() {
        bonjour= bonjour="Bonjour "+prenom+"!";
        connected =true;
        connecter="Deconnectez-vous";
      });



      //  bonjour ="Bonjour ";


    }
    //nidh
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text('Mon Compte'),
              actions: <Widget>[
                Container(
                  width: 35,
                  child: Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null),
                  ),
                ),
                Container(
                  width: 35,
                  child: Center(
                    child: Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddProduct()),
                            );
                          },
                        ),
                        bloc.allItems.length > 0
                            ? Positioned(
                                child: Container(
                                decoration: new BoxDecoration(
                                  color: Colors.orange.shade700,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  bloc.allItems.length.toString(),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ))
                            : Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              child: loading
                  ? CircularProgressIndicator()
                  : Stack(
                      children: <Widget>[
                        ClipPath(
                          clipper: DiagonalPathClipperOne(),
                          child: Container(
                            height: 110,
                            color: Colors.black87,
                          ),
                        ),
                        SafeArea(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20,top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                     // 'Bonjour!',
                                      bonjour,
                                      style: TextStyle(
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          height: 1.5,
                                          color: Colors.orangeAccent),
                                    ),
                                    connected ?Row(
                                      children: [
                                        SizedBox(
                                          height: 35,
                                        ),
                                      ],



                                    ):   Row(
                                      children: [
                                        Text(
                                          "Merci d'insérer votre compte",
                                          style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(
                                          child: FlatButton(
                                            color: Colors.orangeAccent,
                                            textColor: Colors.white,
                                            padding: EdgeInsets.all(7.0),
                                            splashColor: Colors.blueAccent,
                                            onPressed: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        LoginPage())),
                                            child: Text(
                                              "Connectez-vous",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontFamily: 'JosefinSans',
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'MON COMPTE',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Divider(),
                              Container(
                                child: FlatButton(
                                  padding: EdgeInsets.all(8.0),
                                  onPressed: () async {
                                    String value =
                                        await storage.read(key: "token");
                                    print(value);
                                    String v = await storage.read(key: "tokenPan");
                                    print(v);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.card_giftcard ,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      VerticalDivider(),
                                      Text(
                                        "Mes Commandes",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),

                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 20.0),
                                width: 400,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).hoverColor,
                                ),
                                child: Text("Mes Paramétres"),
                              ),
                              Divider(),
                              Container(
                                child: FlatButton(
                                  padding: EdgeInsets.all(8.0),
                                  onPressed: () {
                                    if(!connected){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => LoginPage()));

                                    }else{
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) =>Prof()));
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      VerticalDivider(),
                                      Text(
                                        "Profile",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              Container(
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(left: 20.0),
                                width: 400,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).hoverColor,
                                ),
                                child: FlatButton(
                                  textColor: Colors.orangeAccent,
                                  padding: EdgeInsets.all(8.0),
                                  onPressed: () async {
                                    if(!connected){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => LoginPage()));
                                    }else{
                                      showAlertDialog(context);




                                    }

                                  }
                                  ,
                                  child: Text(
                                    connecter,
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });

  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () async {
       await disc();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MainNavigation(par: 2,)), (route) => false);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation de déconnexion"),
      content: Text("Etes vous sur de vouloir quitter?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  disc () async{
    await storage.write(key: "token", value:null);
    await storage.write(key: "tokenPan", value: null);
    setState(() {
      bonjour="Bonjour!";
      connected =false;
      connecter="Connectez-vous";

    });

  }
  String capitalize(String string) {
    if (string == null) {
      throw ArgumentError.notNull('string');
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }



  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
