import 'package:ecomerce/screens/chat/chat.dart';
import 'package:ecomerce/screens/chat/message.dart';
import 'package:ecomerce/screens/compte/login_page.dart';
import 'package:ecomerce/screens/phone/phone.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Aide extends StatefulWidget {
  const Aide({
    Key key,
  }) : super(key: key);
  @override
  _AideState createState() => _AideState();
}

class _AideState extends State<Aide> {
  bool loading = true;
  bool isSwitched = false;
  final storage = new FlutterSecureStorage();
  bool connected =false ;

  void _loadData() async {
    String value =  await storage.read(key: "token");
    if(value == null){
      setState(() {
        connected = false;
      });

    }else{
      setState(() {
        connected = true;
      });

    }
    await Future.delayed(const Duration(seconds: 3));
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
    return StreamBuilder(
        initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text('Aide'),
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
              child: Center(
                child: loading
                    ? CircularProgressIndicator()
                    : Container(
                        //padding: EdgeInsets.all(16.0),
                        color: Theme.of(context).hoverColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           Container(
                             padding: EdgeInsets.all(16.0),
                             child:  FlatButton(
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(0.0),
                                   side: BorderSide(color: Colors.red)),
                               onPressed: (){
                                 if(connected){
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => MessageList()),
                                   );
                                 }else{
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (_) => LoginPage()));
                                 }
                               },
                               color: Colors.orange.shade500,
                               textColor: Colors.white,
                               child: Container(
                                 child: Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     IconButton(
                                         icon: Icon(
                                           Icons.message,
                                           color: Colors.white,
                                         ),
                                     ),
                                     Text(
                                       "Démarrer le chat en direct"
                                           .toUpperCase(),
                                       style: TextStyle(
                                         fontSize: 18.0,
                                         fontFamily: 'JosefinSans',
                                         fontWeight: FontWeight.bold,
                                         height: 1.5,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                            Container(
                              padding: EdgeInsets.only(left: 20.0),
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "à propos de ecomerce".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              //padding: EdgeInsets.only(top: 10.0),
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                  if(connected){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Phone()),
                                    );
                                  }else{
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => LoginPage()));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Appeler",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'JosefinSans',
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.navigate_next_rounded,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.only(top: 10.0),
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pays",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'JosefinSans',
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child:Row(
                                        children: [
                                          Text(
                                            "Pays",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: 'JosefinSans',
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                            ),
                                          ),
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: Colors.black,
                                          ),
                                        ],
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.only(top: 10.0),
                              color: Colors.white,
                              child: FlatButton(
                                onPressed: () {
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Notifications",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'JosefinSans',
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Switch(
                                        value: isSwitched,
                                        onChanged: (value){
                                          setState(() {
                                            isSwitched = value;
                                            print(isSwitched);
                                          });
                                        },
                                        activeTrackColor: Colors.yellow,
                                        activeColor: Colors.orangeAccent,
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          );
        });
  }
}
