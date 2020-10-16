import 'package:ecomerce/models/product_moll.dart';
import 'package:ecomerce/screens/category/filter_category.dart';
import 'package:ecomerce/screens/product/detail_product.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce/components/assets.dart';



class ListProduct extends StatelessWidget {
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
                        child: PNetworkImage(restaurants[index]["image"], fit: BoxFit.cover )),
                    SizedBox(height: 10.0,),
                    Text(restaurants[index]["name"], style: Theme.of(context).textTheme.title.merge(TextStyle(
                        fontSize: 14.0
                    ))),
                    SizedBox(height: 5.0,),
                    Text(restaurants[index]["specials"], style: Theme.of(context).textTheme.subhead.merge(TextStyle(
                        fontSize: 12.0
                    )))
                  ],
                ),
              )
            ],
          )
        );
      },
          childCount: restaurants.length
      ),
    );
  }
}


