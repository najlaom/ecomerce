import 'package:ecomerce/components/assets.dart';
import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  String image;

  Product({this.title, this.image, this.id});
}
List<Product> products = [
  Product(
    id: 0,
    title: "Mon parfin",
    image: imageProduct[0],
  ),
  Product(
    id: 1,
    title: "Mon parfin",
    image: imageProduct[1],
  ),
  Product(
    id: 2,
    title: "Mon parfin",
    image: imageProduct[0],
  ),
  Product(
    id: 5,
    title: "Mon parfin",
    image: imageProduct[1],
  ),
];