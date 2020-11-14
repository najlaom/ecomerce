import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce/components/assets.dart';
class CategoryProduct {
  final String image, title, description;
  final int  size, id, qty, price;
  final Color color;
  CategoryProduct({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.qty
  });
}
List<CategoryProduct> categoriesProducts = [
  CategoryProduct(
      id: 1,
      title: "Kappa Velour",
      price: 40,
      size: 12,
      description: "dumyText",
      image: images[0],
      qty: 2,
      color: Colors.deepOrange
  ),
  CategoryProduct(
      id: 2,
      title: "North Salty",
      price: 512,
      size: 12,
      description: "dumyText",
      image: images[1],
      qty: 2,
      color: Color(0xFF3D82AE)
  ),
  CategoryProduct(
      id: 3,
      title: "Mest Takel",
      price: 234,
      size: 12,
      description: "dumyText",
      image: images[2],
      qty: 2,
      color: Color(0xFF3D82AE)
  ),
  CategoryProduct(
      id: 4,
      title: "office code",
      price: 234,
      size: 12,
      description: "dumyText",
      image: images[4],
      qty: 2,
      color: Color(0xFF3D82AE)
  ),
  CategoryProduct(
      id: 5,
      title: "office code",
      price: 234,
      size: 12,
      description: "dumyText",
      image: images[3],
      qty: 2,
      color: Color(0xFF3D82AE)
  ),
  CategoryProduct(
      id: 6,
      title: "office code",
      price: 234,
      size: 12,
      description: "dumyText",
      image: images[5],
      qty: 2,
      color: Color(0xFF3D82AE)
  ),
  // CategoryProduct(
  //     id: 7,
  //     title: "office code",
  //     price: "234 TND",
  //     size: 12,
  //     description: "dumyText",
  //     image: images[6],
  //     qty: 3,
  //     color: Color(0xFF3D82AE)
  // ),
  // CategoryProduct(
  //     id: 8,
  //     title: "office code",
  //     price: "234 TND",
  //     size: 12,
  //     description: "dumyText",
  //     image: images[7],
  //     qty: 2,
  //     color: Color(0xFF3D82AE)
  // ),
  // CategoryProduct(
  //     id: 8,
  //     title: "office code",
  //     price: "234 TND",
  //     size: 12,
  //     description: "dumyText",
  //     image: images[8],
  //     qty: 2,
  //     color: Color(0xFF3D82AE)
  // ),
  // CategoryProduct(
  //     id: 8,
  //     title: "office code",
  //     price: "234 TND",
  //     size: 12,
  //     description: "dumyText",
  //     image: images[9],
  //     qty: 2,
  //     color: Color(0xFF3D82AE)
  // ),
  // CategoryProduct(
  //     id: 8,
  //     title: "office code",
  //     price: "234 TND",
  //     size: 12,
  //     description: "dumyText",
  //     image: images[10],
  //     qty: 2,
  //     color: Color(0xFF3D82AE)
  // ),
  // CategoryProduct(
  //     id: 8,
  //     title: "office code",
  //     price: "234 TND",
  //     size: 12,
  //     description: "dumyText",
  //     image: images[11],
  //     qty: 2,
  //     color: Color(0xFF3D82AE)
  // )
];
