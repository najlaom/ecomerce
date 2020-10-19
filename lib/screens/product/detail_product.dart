import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/product_service.dart';
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
    var productDetails =
        await ProductService().getProductByDetails(this.widget.idProduct.toString());
    print(productDetails.toString());
    if (productDetails.length > 0) {
      setState(() {
        product = productDetails;
        //fetch Products of firs Cat
        // currentCat = cats[0]["id"];
      });
      print("bbbbbbbbbbbbbbbbbbbbb");
      print(product.toString());
      // _fetchcatProducts();
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
        backgroundColor: Colors.green,
        title: Text("Details"),
      ),
      body: _buildPageContent(context),
    );
  }

  Widget _buildPageContent(context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildItemCard(context),
              Container(
                  padding: EdgeInsets.all(30.0),
                  child: GrocerySubtitle(
                      text:
                          product["descriptions"].toString())),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.green,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MyOrderPage())),
                  child: Text("Add to Cart"),
                ),
              ),
            )
          ],
        )
      ],
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
                    product["image"],
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GroceryTitle(text: product["name"].toString()),
                SizedBox(
                  height: 5.0,
                ),
                GrocerySubtitle(text: product["prix"].toString())
              ],
            ),
          ),
        ),
      ],
    );
  }
}
