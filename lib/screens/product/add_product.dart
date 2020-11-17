import 'package:ecomerce/models/model.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecomerce/components/assets.dart';
import 'package:ecomerce/components/colors.dart';

final priceTextStyle = TextStyle(
  color: Colors.grey.shade600,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

class AddProduct extends StatefulWidget {
  String idProduct;
  AddProduct({this.idProduct});
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  List cartContent = [];

  @override
  void initState() {
    super.initState();
    cartContent = bloc.allItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: 80,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(
              16.0,
              kToolbarHeight + 40.0,
              16.0,
              16.0,
            ),
            children: [
              Text(
                "My Order",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              ...cartContent
                  .map((e) => Column(
                        children: [
                          OrderListItem(product: e),
                          const SizedBox(height: 20.0),
                        ],
                      ))
                  .toList(),
              _buildDivider(),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "VAT (10%)",
                    style: priceTextStyle,
                  ),
                  Spacer(),
                  Text(
                    "\$2",
                    style: priceTextStyle,
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              const SizedBox(height: 20.0),
              _buildDivider(),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(width: 40.0),
                  Text(
                    "Total",
                    style: priceTextStyle.copyWith(color: Colors.black),
                  ),
                  Spacer(),
                  Text(
                    "\$49",
                    style: priceTextStyle.copyWith(color: Colors.indigo),
                  ),
                  const SizedBox(width: 20.0),
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                child: RaisedButton(
                  padding: const EdgeInsets.all(16.0),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.yellow.shade700,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 2.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}

class OrderItem {
  final String title;
  final int qty;
  final double price;
  final String image;
  final Color bgColor;
  OrderItem({this.title, this.qty, this.price, this.image, this.bgColor});
}

class OrderListItem extends StatefulWidget {
  final product;

  const OrderListItem({Key key, this.product}) : super(key: key);

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: widget.product['image'] != null
                ? Image.network(
                    "http://192.168.1.3:8085/image/" + widget.product['image'],
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.product['name'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            bloc.removeFromCart(widget.product);
                          });
                        },
                      ),
                      Text(
                        "${widget.product['quantite']}",

                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      IconButton(
                        iconSize: 18.0,
                        padding: const EdgeInsets.all(2.0),
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            bloc.addToCart(widget.product);
                            print(widget.product['quantite']);
                            print(widget.product);
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            children: [
              Text(
                "\$${widget.product['prix'] * widget.product['quantite']}",
                style: priceTextStyle,
              ),
              IconButton(
                iconSize: 18.0,
                padding: const EdgeInsets.all(2.0),
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    bloc.deletItem(widget.product);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
