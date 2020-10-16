import 'package:ecomerce/screens/compte/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Compte extends StatefulWidget {
  const Compte({
    Key key,
  }) : super(key: key);
  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  bool loading = true;
  final Color divider = Colors.grey.shade600;

  void _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
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
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  onPressed: null),
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
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bonjour!',
                                style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    height: 1.5,
                                    color: Colors.white),
                              ),
                              Row(
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
                                          context, MaterialPageRoute(builder: (_) => LoginPage())),
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
                          child: Text('MON COMPTE',style: TextStyle(
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
                        Container(
                          child: FlatButton(
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                VerticalDivider(),
                                Text(
                                  "Flat Button",
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
                          child: FlatButton(
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                VerticalDivider(),
                                Text(
                                  "Flat Button",
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
                          child: FlatButton(
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                VerticalDivider(),
                                Text(
                                  "Flat Button",
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
                        Container(
                          child: FlatButton(
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                VerticalDivider(),
                                Text(
                                  "Flat Button",
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
                          child: FlatButton(
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Theme.of(context).primaryColor,
                                ),
                                VerticalDivider(),
                                Text(
                                  "Flat Button",
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
                            onPressed: () => Navigator.push(
                                context, MaterialPageRoute(builder: (_) => LoginPage())),
                            child: Text(
                              "Connectez-vous",
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
  }
  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
