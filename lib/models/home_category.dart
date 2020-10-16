import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final int id;

  Category({this.icon, this.name, this.color, this.id});
}

List<Category> categories = [
  Category(
      id: 0, icon: Icons.shopping_basket, name: "Shopping", color: Colors.orange.shade700),
  Category(
      id: 1, icon: Icons.local_drink, name: "Cofee & Bar", color: Colors.red.shade700),
  Category(
      id: 2, icon: Icons.event_available, name: "Events", color: Colors.purpleAccent.shade700),
  Category(
      id: 3, icon: Icons.all_inclusive, name: "Prime", color: Colors.lightBlueAccent.shade700),
  Category(
      id: 4, icon: Icons.card_travel, name: "Job Street", color: Colors.green.shade700),
  Category(
      id: 5, icon: Icons.restaurant, name: "Restaurant", color: Colors.pinkAccent.shade700),
  Category(
      id: 6, icon: Icons.videogame_asset_outlined, name: "Jouez et Gagnez!", color: Colors.grey.shade700),
  Category(
      id: 7, icon: Icons.phone_in_talk, name: "Telephone", color: Colors.lightGreenAccent.shade700),

];
