import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String title;
  CategoryItem(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {},
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11.0,
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
