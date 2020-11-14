import 'package:ecomerce/screens/product/detail_product.dart';
import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  var prdList;
  Product({this.prdList});
  @override
  _ProductState createState() => _ProductState();
}
class _ProductState extends State<Product> {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }
  var productList = [];

  _fetchProducts() async {
    print("_fetchProducts");
    var products = await ProductService().getProducts();
    print(products.toString());
    if (products.length > 0) {
      setState(() {
        productList = products;
        //fetch Products of firs Cat
        // currentCat = cats[0]["id"];
      });
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print(productList.toString());
      // _fetchcatProducts();
    } else {
      setState(() {
        productList = [];
      });
    }
  }

  // _fetchProducts() async {
  //   print("_fetchProducts");
  //   var products = await ProductService().getProducts();
  //   print(products.toString());
  //   if (products.length > 0) {
  //     setState(() {
  //       productList = products;
  //       //fetch Products of firs Cat
  //       // currentCat = cats[0]["id"];
  //     });
  //     print(products.toString());
  //     // _fetchcatProducts();
  //   } else {
  //     setState(() {
  //       productList = [];
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.0),
      height: 500,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(this.widget.prdList.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsProduct(idProduct: productList[index]['id'].toString()),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        color: Colors.red,
                        //width: 200,
                        child: (this.widget.prdList[index]['image'] != null)
                            ? Image.network(
                         "http://192.168.43.144:8085/image/"+this.widget.prdList[index]['image'],
                                width: 50,
                                height: 50,
                              )
                            : null),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(this.widget.prdList[index]['name']),
                    )
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
