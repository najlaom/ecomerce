import 'package:ecomerce/screens/home/home_menu.dart';
import 'package:ecomerce/screens/home/home_product_promo.dart';
import 'package:ecomerce/screens/home/home_swiper.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;

  void _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    bloc.initCart();
  }

  Widget _buildListView(_, index) {
    if (index == 0) return HomeSwiper();
    if (index == 1) return HomeMenu();
    if (index == 2) return HomeProductPromo();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: Colors.black87,
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: Text(
                              'Recherche sur moll ' ,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                Container(
                  width: 35,
                  child: Center(
                    child: Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddProduct()),
                            );
                          },
                        ),
                        bloc.allItems.length > 0
                            ? Positioned(
                                right: 15,
                                top: -3,
                                child: Container(
                                    decoration: new BoxDecoration(
                                      color: Colors.orange.shade700,
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(bloc.allItems.length.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white))),
                              )
                            : Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              child: Center(
                child: loading
                    ? CircularProgressIndicator()
                    : SafeArea(
                        child: ListView.builder(
                        itemBuilder: _buildListView,
                        itemCount: 20,
                      )),
              ),
            ),
          );
        });
  }
}
