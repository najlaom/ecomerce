import 'dart:convert';
import 'package:ecomerce/screens/category/product_item.dart';
import 'package:ecomerce/screens/product/list_product.dart';
import 'package:ecomerce/services/category_service.dart';
import 'package:ecomerce/widgets/category_item.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  const Category({
    Key key,
  }) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool loading = true;
  final Color divider = Colors.grey.shade600;

  void _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
  }
  var categoryList = [];
  _fetchCategories() async {
    print("_fetchCategories");
    var categories = await CategoryService().getCategory();
    print(categories.toString());
    if (categories.length > 0) {
      setState(() {
        categoryList = categories;
        //fetch Products of firs Cat
       // currentCat = cats[0]["id"];
      });
      print(categories.toString());
     // _fetchcatProducts();
    } else {
      setState(() {
        categoryList = [];
      });
    }
  }

  @override
  void initState() {
    _loadData();
    _fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.black87,
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        'Recherche sur moll',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 35,
            child: Center(
              child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  onPressed: null),
            ),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Container(
                  //alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: ListView.builder(
                            itemCount: categoryList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                              CategoryItem(
                                categoryList[index]['name'],
                              ),
                              Divider()
                                ],
                              );
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                        width: 5,
                      ),
                      Container(
                          width: 300,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 7,
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          "Tous les Produits",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'JosefinSans',
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.navigate_next_rounded,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                ProductItem(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                ProductItem(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                ProductItem(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                ProductItem(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                ProductItem()
                              ],
                            )
                          )),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
