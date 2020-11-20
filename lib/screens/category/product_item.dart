import 'package:ecomerce/screens/category/product.dart';
import 'package:ecomerce/screens/product/list_product.dart';
import 'package:ecomerce/screens/product/list_product_by_category.dart';
import 'package:ecomerce/services/category_service.dart';
import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductItem extends StatefulWidget {
  String nameCategory;
  String idByCategory;
  var prdList;
  ProductItem({this.nameCategory, this.prdList, this.idByCategory});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  String nameCategory = "";
  var idByCategory = [];
  @override
  void initState() {
    super.initState();
    print("this.widget.idByCategory");
    print(this.widget.idByCategory);
    _fetchCategories();
  }

  _fetchPrdByCat(String idCat) async {
    print("_fetchPrdByCat");
    var prdByCat = await ProductService().getProductsByCat(idCat);
    print(prdByCat.toString());
    if (prdByCat.length > 0) {
      setState(() {
        idByCategory = prdByCat;
        //idByCategory = idByCategory[0]['image'];
      });
      print(idByCategory.toString());
    } else {
      setState(() {
        idByCategory = [];
      });
    }
  }

  var categoryList = [];
  _fetchCategories() async {
    print("_fetchCategories");
    var categories = await CategoryService().getCategory();
    print("categories.toString()");
    print(categories.toString());
    if (categories.length > 0) {
      setState(() {
        categoryList = categories;
        nameCategory = categories[0]["name"].toString();
        _fetchPrdByCat(categories[0]["id"].toString());
        //fetch Products of firs Cat
        // currentCat = cats[0]["id"];
      });

      print(categories.toString());
      //_fetchcatProducts();
    } else {
      setState(() {
        categoryList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
          ),
          height: 5,
        ),
        Container(
          height: 30,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.widget.nameCategory,
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Container(
                //alignment: Alignment.centerLeft,
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => listProductByCategory(
                                    idProductByCat:
                                        this.widget.idByCategory.toString(),
                                    nameCat:
                                        this.widget.nameCategory.toString(),
                                prdList: this.widget.prdList
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          'Voir tout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        Divider(),
        Container(
            padding: EdgeInsets.only(left: 3.0),
            height: 500,
            child: Column(
              children: [Product(prdList: this.widget.prdList)],
            )),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
