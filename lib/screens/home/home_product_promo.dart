import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProductPromo extends StatefulWidget {
  @override
  _HomeProductPromoState createState() => _HomeProductPromoState();
}

class _HomeProductPromoState extends State<HomeProductPromo> {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  var productList = [];

  _fetchProducts() async {
    print("_fetchProducts");
    var products = await ProductService().getProductsPromo();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.count(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(productList.length, (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(1)),
              ),
              child: Card(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    PNetworkImage(
                      "http://10.0.2.2:8080/image/" +
                          productList[index]["image"],
                      height: 150,
                    ),
                    Positioned(
                      bottom: 50,
                      right: 30,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(productList[index]["name"].toString()),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 80,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(productList[index]["prix"].toString()),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 10,
                     child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productList[index]["promoPercentage"].toString(),
                              style: TextStyle(fontSize: 18.0, color: Colors.white),
                            ),
                            Text(
                              "%", style: TextStyle(fontSize: 18.0, color: Colors.white),
                            ),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
