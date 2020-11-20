import 'package:ecomerce/main_navigation.dart';
import 'package:flutter/material.dart';




void main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecomerce",
      //nidh
      home: MainNavigation(par: 0,),
      //nidh
    );
  }
}
