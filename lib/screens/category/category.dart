import 'package:ecomerce/models/model.dart';
import 'package:ecomerce/screens/product/list_product.dart';
import 'package:ecomerce/widgets/category_item.dart';
import 'package:ecomerce/widgets/network_image.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({
    Key key,
  }) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool loading = true;
  final Color divider = Colors.grey.shade600;
  void _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        'Recherche sur moll',
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
      body: Container(
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Container(
                  //alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        child: ListView.builder(
                            itemCount: Lcategories.length,
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                Lcategories[index].title,
                              );
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).hoverColor,
                        ),
                        width: 5,
                      ),
                      Container(
                          width: 300,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 7,
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text(
                                          "Tous les Produits",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'JosefinSans',
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.navigate_next_rounded,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                      EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Petits électroménager",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                        ),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          onPressed: () => Navigator.push(
                                              context, MaterialPageRoute(builder: (_) => ListProduct())),
                                          child: Text(
                                            'Voir tout',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                    padding: EdgeInsets.only(left: 3.0),
                                    height: 200,
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                          ],
                                        ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                  EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Petits électroménager",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                        ),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Voir tout',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                    padding: EdgeInsets.only(left: 3.0),
                                    height: 200,
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                          ],
                                        ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                  EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Petits électroménager",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                        ),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Voir tout',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                    padding: EdgeInsets.only(left: 3.0),
                                    height: 200,
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                          ],
                                        ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).hoverColor,
                                  ),
                                  height: 5,
                                ),
                                Container(
                                  height: 30,
                                  alignment: Alignment.center,
                                  padding:
                                  EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Petits électroménager",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'JosefinSans',
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                        ),
                                      ),
                                      Container(
                                        child: FlatButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Voir tout',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                    padding: EdgeInsets.only(left: 3.0),
                                    height: 200,
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                          ],
                                        ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
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
                                                          width: 80,
                                                          child: PNetworkImage(
                                                            "https://i.skyrock.net/9295/59159295/pics/2749503246_1.jpg",
                                                            width: 50,
                                                            height: 50,
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
                                                Text("data")
                                              ],
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),

                              ],
                            ),
                          )),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }
}
