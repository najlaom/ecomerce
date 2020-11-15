import 'package:ecomerce/screens/category/product.dart';
import 'package:ecomerce/screens/product/list_product.dart';
import 'package:ecomerce/screens/product/list_product_by_category.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  String nameCategory;
  var prdList;
  ProductItem({this.nameCategory, this.prdList});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    super.initState();
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
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
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
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ListProductByCategory())),
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
