import 'package:ecomerce/screens/category/category.dart';
import 'package:ecomerce/screens/category/product_item.dart';
import 'package:ecomerce/services/category_service.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  String title;
  CategoryItem(this.title);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  var categoryList = [];

  // _fetchCategories() async {
  //   print("_fetchCategoriesddddddd");
  //   var categories = await CategoryService().getCategory();
  //   print(categories.toString());
  //   if (categories.length > 0) {
  //     setState(() {
  //       categoryList = categories;
  //       //fetch Products of firs Cat
  //       // currentCat = cats[0]["id"];
  //     });
  //     print(categories.toString());
  //     // _fetchcatProducts();
  //   } else {
  //     setState(() {
  //       categoryList = [];
  //     });
  //   }
  // }
  @override
  void initState() {
    super.initState();
    // _fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: FlatButton(
        // onPressed: () => Navigator.push(
        //     context, MaterialPageRoute(builder: (_) => ProductItem(id: categoryList['id'].toString(), title: categoryList['name']))),
        child: Text(
          widget.title,
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
