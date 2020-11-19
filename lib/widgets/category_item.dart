import 'package:ecomerce/screens/category/category.dart';
import 'package:ecomerce/screens/category/product_item.dart';
import 'package:ecomerce/services/category_service.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String title;

  CategoryItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}