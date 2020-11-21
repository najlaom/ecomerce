import 'package:flutter/material.dart';

class Livraison extends StatefulWidget {
  @override
  _LivraisonState createState() => _LivraisonState();
}

class MyApp extends StatefulWidget {
  @override
  _LivraisonState createState() => new _LivraisonState();
}

//State is information of the application that can change over time or when some actions are taken.
class _LivraisonState extends State<Livraison> {
  List picked = [false, false];

  int totalAmount = 0;

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
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.yellow.shade700,
                child: Text(
                  "Valider".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Livraison()),
                  );
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
            children: [Text("nom"), Text("addresse"), Text("num telephone")],
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

