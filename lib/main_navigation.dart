import 'package:ecomerce/screens/screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  final int par;

  const MainNavigation({
    Key key, this.par,
  }) : super(key: key);
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  int _currentIndex ;
  final items = <Widget>[Home(), Category(), Compte(), Aide()];

  //test  initi

  @override
  void initState() {

    _currentIndex=widget.par;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toc_outlined),
            title: Text('Catégories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Comptes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms),
            title: Text('Aide'),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: items),
    );
  }
  //this
}
