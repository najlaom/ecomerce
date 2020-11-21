import 'package:ecomerce/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ecomerce/components/assets.dart' as assets;

class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  var productList = [];

  _fetchProducts() async {
    print("_fetchProducts");
    var products = await ProductService().getProductsSponsor();
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
    return Card(
      elevation: 2.0,
      child: Container(
        height: 180,
        child: Swiper(
          scale: 0.8,
          viewportFraction: 0.5,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: Colors.orange.shade700,
                  width: 1,
                ),
              ),

              child: Image.network(
                  "http://192.168.1.4:8085/image/" +
                      productList[index]["image"],
                  fit: BoxFit.fill),
            );
          },
          itemCount: productList.length,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.red,
                size: 5.0,
                activeSize: 7.0),
          ),
        ),
      ),
    );
  }
}
