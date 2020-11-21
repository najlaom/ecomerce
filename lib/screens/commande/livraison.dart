import 'package:ecomerce/services/NetworkHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Livraison extends StatefulWidget {
  @override
  _LivraisonState createState() => _LivraisonState();
}



//State is information of the application that can change over time or when some actions are taken.
class _LivraisonState extends State<Livraison> {
  List picked = [false, false];

  int totalAmount = 0;
  final storage = new FlutterSecureStorage();
  bool loading = true;
  NetworkHandler networkHandler = NetworkHandler();
  var user;

  pickToggle(index) {
    setState(() {
      picked[index] = !picked[index];
      getTotalAmount();
    });
  }

  getTotalAmount() {
    var count = 0;
    for (int i = 0; i < picked.length; i++) {
      if (picked[i]) {
        count = count + 1;
      }
      if (i == picked.length - 1) {
        setState(() {
          totalAmount = 248 * count;
        });
      }
    }
  }
  void _loadData() async{

    String value = await storage.read(key: "token");
    String v = await storage.read(key: "tokenPan");
    var response = await networkHandler.getUser("api/users/getUserById",value);
    setState(() {
      user = response['user'];

    });
    print(user);



    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      loading = false;
    });




  }

  @override
  void initState() {
    // TODO: implement initState
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Annuler',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                width: MediaQuery.of(context).size.width - 0.0,
                height: 60,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Theme.of(context).hoverColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Détails de l'adresse".toUpperCase(),
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "changer".toUpperCase(),
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                )),
            itemCardInfo(),
            itemCardLiv(),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              width: MediaQuery.of(context).size.width - 20.0,
              height: 50,
              child: RaisedButton(
                padding: const EdgeInsets.all(16.0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.yellow.shade700,
                child: Text(
                  "Passer Commande".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemCardInfo() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 2.0,
        child: Container(
          // alignment: Alignment.topCenter,
          padding: EdgeInsets.only(left: 15.0, right: 10.0),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [Text("Client: "+user['prenom']+" "+user['nom']),
              Text("Adresse: "+user['adress']+" "+user['region']+" "+user['ville']),
              Text("Télephone: "+user['phone'].toString()+"/"+user['phone'].toString())

            ],
          ),
        ),
      ),
    );
  }
  Widget itemCardLiv(){
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 2.0,
        child: Container(
          // alignment: Alignment.topCenter,
          padding: EdgeInsets.only(left: 15.0, right: 10.0),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Coli 1"),
              Row(
                children: [
                  Text("quntite"),
                  Text("x"),
                  Text('name'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemCard(itemName, color, available, i) {
    return InkWell(
      onTap: () {
        if (available) {
          pickToggle(i);
        }
      },
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                  padding: EdgeInsets.only(left: 15.0, right: 10.0),
                  width: MediaQuery.of(context).size.width - 20.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: available
                                    ? Colors.grey.withOpacity(0.4)
                                    : Colors.red.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12.5),
                              ),
                              child: Center(
                                  child: available
                                      ? Container(
                                    height: 12.0,
                                    width: 12.0,
                                    decoration: BoxDecoration(
                                        color: picked[i]
                                            ? Colors.yellow
                                            : Colors.grey
                                            .withOpacity(0.4),
                                        borderRadius:
                                        BorderRadius.circular(6.0)),
                                  )
                                      : Container()))
                        ],
                      ),
                      SizedBox(width: 4.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                itemName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(width: 7.0),
                              available
                                  ? picked[i]
                                  ? Text(
                                'x1',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.grey),
                              )
                                  : Container()
                                  : Container()
                            ],
                          ),
                          SizedBox(height: 7.0),
                          available
                              ? Text(
                            'Color: ' + color,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                                color: Colors.grey),
                          )
                              : OutlineButton(
                            onPressed: () {},
                            borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.0,
                                style: BorderStyle.solid),
                            child: Center(
                              child: Text('Find Similar',
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Colors.red)),
                            ),
                          ),
                          SizedBox(height: 7.0),
                        ],
                      )
                    ],
                  )))),
    );
  }
}

