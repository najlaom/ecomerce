import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget{
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
      print(products.toString());
      // _fetchcatProducts();
    } else {
      setState(() {
        productList = [];
      });
    }
  }

  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.only(left: 3.0),
     height: 200,
     child: GridView.count(
         crossAxisCount: 3,
       children: List.generate(productList.length, (index){
         return GestureDetector(
             onTap: () {},
           child: Column(
             children: [
               Row(
                 children: [
                   Column(
                     children: [
                       Container(
                         height: 70,
                         child: Row(
                           children: [
                             Container(
                               width: 5,
                               decoration:
                               BoxDecoration(
                                 color:
                                 Theme.of(context)
                                     .hoverColor,
                               ),
                             ),
                             Container(
                                 width: 200,
                                 child: Image.asset(
                                   productList[index]['image'],
                                   width: 30,
                                   height: 30,
                                 )),
                             Container(
                               width: 5,
                               decoration:
                               BoxDecoration(
                                 color:
                                 Theme.of(context)
                                     .hoverColor,
                               ),
                             ),
                           ],
                         ),
                       ),
                       Text(productList[index]['name'])
                     ],
                   ),

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