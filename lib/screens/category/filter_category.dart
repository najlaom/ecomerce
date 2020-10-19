import 'package:flutter/material.dart';

class FilterCategory extends StatefulWidget {
  @override
  _FilterCategoryState createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  List<String> categories = [
    "Popularité",
    "Nouveautés",
    "Mieux Notés",
    "Prix le plus bas",
    "Prix le plus élevé"
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index),
        ),
      ),
    );
  }

  Widget _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectIndex == index ? Colors.white : Colors.white70,
                ),
              ),
              Container(
                height: 2,
                width: 60,
                color: selectIndex == index ? Colors.white : Colors.transparent,
                margin: EdgeInsets.only(top: 20.0 / 4),
              )
            ],
          )),
    );
  }
}
