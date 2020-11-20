import 'dart:io';

import 'package:ecomerce/screens/home/home.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:ecomerce/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce/components/assets.dart';
import 'package:ecomerce/widgets/list_item.dart';
import 'package:ecomerce/widgets/item_prography.dart';
import 'package:ecomerce/widgets/network_image.dart';

class DetailsProduct extends StatefulWidget {
  String idProduct;
  DetailsProduct({this.idProduct});
  @override
  _DetailsProductState createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  void initState() {
    super.initState();
    _getProductsByDetails();
  }

  var product = {};
  _getProductsByDetails() async {
    print("_fetchProducts");
    var productDetails = await ProductService()
        .getProductByDetails(this.widget.idProduct.toString());
    print(productDetails.toString());
    if (productDetails.length > 0) {
      setState(() {
        product = productDetails;
      });
      print(product.toString());
    } else {
      setState(() {
        product = {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Details"),
      ),
      body:  (_buildPageContent(context) != null)
      ? _buildPageContent(context) : null,
    );
  }

  Widget _buildPageContent(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildItemCard(context),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                color: Colors.orange),
            child: Text(
              "Descriptions",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    fontSize: 18,
                    fontFamily: 'JosefinSans',
                  ),
            ),
          ),
          Container(
            height: 190,
            child: Card(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child:Expanded(
                child:  ListView.builder(
                    itemCount: product["descriptions"].length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Row(
                          children: [
                            Text(
                              product["descriptions"][index]["name"].toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 18,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                            Text(
                              ':',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 18,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                            Text(
                              product["descriptions"][index]["value"].toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 16,
                                fontFamily: 'JosefinSans',
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                color: Colors.orange),
            child: Text(
              "Accessoires",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    fontSize: 18,
                    fontFamily: 'JosefinSans',
                  ),
            ),
          ),
          Container(
            height: 150,
            child: Card(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child: Expanded(
                child: ListView.builder(
                    itemCount: product["accessories"].length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Row(
                          children: [
                            Text(
                              product["accessories"][index]["name"].toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 18,
                                fontFamily: 'JosefinSans',
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            height: 35,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                color: Colors.orange),
            child: Text(
              "Features",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    fontSize: 18,
                    fontFamily: 'JosefinSans',
                  ),
            ),
          ),
          Container(
            height: 100,
            child: Card(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child:Expanded(
                child:  ListView.builder(
                    itemCount: product["features"].length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Row(
                          children: [
                            Text(
                              product["features"][index]["name"].toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 18,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                            Text(
                              ':',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style:
                              Theme.of(context).textTheme.subtitle2.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 18,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                            Text(
                              product["features"][index]["value"].toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 16,
                                fontFamily: 'JosefinSans',
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          _buildAddToCartButton(),
        ],
      ),
    );
  }

  Widget _buildItemCard(context) {
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: PNetworkImage(
                    "http://10.0.2.2:8080/image/" + product["image"],
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GroceryTitle(text: product["name"].toString()),
                SizedBox(
                  height: 5.0,
                ),
                GrocerySubtitle(
                  text: product["prix"].toString(),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 60,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AddProduct()),
                //
                // );
                bloc.addToCart(product);
                Navigator.of(context).pop(null);


              },
              child: Text(
                "Add to Cart",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      fontSize: 20,
                      fontFamily: 'JosefinSans',
                    ),
              ),
              color: Colors.yellow.shade700,
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
