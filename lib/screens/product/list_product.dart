import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce/models/product_moll.dart';
import 'package:ecomerce/screens/category/filter_category.dart';
import 'package:ecomerce/screens/product/detail_product.dart';
import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce/components/assets.dart';



class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final List<String> sliderItems = [
    breakfast,
    burger1,
    meal,
    pancake,
  ];

  final List<Map> restaurants = [
    {
      "image" : burger,
      "name":"Burger King",
      "specials":"Vegetarian, Continental"
    },
    {
      "image" : cherry,
      "name":"Cherry Blossom",
      "specials":"Salads, Dessert"
    },
    {
      "image" : cupcake,
      "name":"Cupcake Dream",
      "specials":"Fast Food"
    },
    {
      "image" : frenchFries,
      "name":"Hungry Kids",
      "specials":"French Fries"
    },
    {
      "image" : cupcake,
      "name":"Cupcake Dream",
      "specials":"Fast Food"
    },
    {
      "image" : frenchFries,
      "name":"Hungry Kids",
      "specials":"French Fries"
    },
    {
      "image" : cupcake,
      "name":"Cupcake Dream",
      "specials":"Fast Food"
    },
    {
      "image" : frenchFries,
      "name":"Hungry Kids",
      "specials":"French Fries"
    },
    {
      "image" : cupcake,
      "name":"Cupcake Dream",
      "specials":"Fast Food"
    },
    {
      "image" : frenchFries,
      "name":"Hungry Kids",
      "specials":"French Fries"
    },
    {
      "image" : cupcake,
      "name":"Cupcake Dream",
      "specials":"Fast Food"
    },
    {
      "image" : frenchFries,
      "name":"Hungry Kids",
      "specials":"French Fries"
    },
  ];
  var productList = [];
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
  //     print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  //     print(productList.toString());
  //     // _fetchcatProducts();
  //   } else {
  //     setState(() {
  //       productList = [];
  //     });
  //   }
  // }

  @override
  void initState() {
    // _fetchProducts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Nom Product'),
        actions: <Widget>[
          Container(
            width: 35,
            child: Center(
              child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: null),
            ),
          ),
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
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context),
          _buildPopularRestaurant(),

        ],
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      textTheme: TextTheme(
          title: Theme.of(context)
              .textTheme
              .title
              .merge(TextStyle(color: Colors.black))),
      iconTheme: IconThemeData(color: Colors.lightGreen),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      expandedHeight: 45,
      floating: true,
      flexibleSpace: Container(
        color: Colors.orange.shade700,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                FilterCategory(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SliverGrid _buildPopularRestaurant() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                     builder: (context) => DetailsProduct(),
                    ),
                  );
                },
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 130.0,
                        width: double.infinity,
                        child: (productList[index]["image"] != null)?
                        Image.network(productList[index]["image"], fit: BoxFit.cover, ): null),
                    SizedBox(height: 10.0,),
                    Text(productList[index]["name"], style: Theme.of(context).textTheme.title.merge(TextStyle(
                        fontSize: 14.0
                    ))),
                    SizedBox(height: 5.0,),
                    Text(productList[index]["prix"].toString(), style: Theme.of(context).textTheme.subhead.merge(TextStyle(
                        fontSize: 12.0
                    )))
                  ],
                ),
              )
            ],
          )
        );
      },
          childCount: productList.length
      ),
    );
  }
}


