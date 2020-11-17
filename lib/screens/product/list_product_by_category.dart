import 'package:ecomerce/screens/category/filter_category.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/screens/product/detail_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:ecomerce/services/category_service.dart';
import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/category_item.dart';
import 'package:flutter/material.dart';

class ListProductByCategory extends StatefulWidget {

  @override
  _ListProductByCategoryState createState() => _ListProductByCategoryState();
}

class _ListProductByCategoryState extends State<ListProductByCategory> {
  @override
  void initState() {
    super.initState();

    _fetchCategories();

  }
  var prdList = [];
  var nameCategory ="";
  var categoryList = [];
  var index;

  _fetchPrdByCat(String idCat) async {
    print("_fetchPrdByCat");

    print(idCat);
    var prdByCat = await ProductService().getProductsByCat(idCat);
    print(prdByCat.toString());
    if (prdByCat.length > 0) {
      setState(() {
        prdList = prdByCat;
      });
      print(prdList.toString());
    } else {
      setState(() {
        prdList = [];
      });
    }
  }

  _fetchCategories() async {
    print("_fetchCategories");
    var categories = await CategoryService().getCategory();
    print("categories.toString()");
    print(categories.toString());
    if (categories.length > 0) {
      setState(() {
        categoryList = categories;
        nameCategory = categories[0]["name"].toString();
        _fetchPrdByCat(ProductService.idByCat.toString());
        //fetch Products of firs Cat
        // currentCat = cats[0]["id"];
      });

      print(categories.toString());
      // _fetchcatProducts();
    } else {
      setState(() {
        categoryList = [];
        nameCategory ="";
      });
    }
  }
 @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context, snapshot){
          return Scaffold(
            //backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text("nameCategory"),
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
                              child: Text(
                                  bloc.allItems.length.toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white)
                              ),
                            )): Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                _buildAppBar(context),
                _buildListProduct(),
              ],
            ),
          );
        });
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
 SliverGrid _buildListProduct() {
   return SliverGrid(
     gridDelegate:
     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
     delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
       return Container(
           padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               GestureDetector(
                 onTap: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => DetailsProduct(idProduct: prdList[index]['id'].toString()),
                     ),
                   );
                 },
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Container(
                         height: 130.0,
                         width: double.infinity,
                         child: ("http://192.168.1.3:8085/image/" + prdList[index]["image"] != null)
                             ? Image.network(
                           "http://192.168.1.3:8085/image/" + prdList[index]["image"],
                           fit: BoxFit.cover,
                         )
                             : null),
                     SizedBox(
                       height: 10.0,
                     ),
                     Text(prdList[index]["name"],
                         style: Theme.of(context)
                             .textTheme
                             .title
                             .merge(TextStyle(fontSize: 14.0))),
                     SizedBox(
                       height: 5.0,
                     ),
                     Text(prdList[index]["prix"].toString(),
                         style: Theme.of(context)
                             .textTheme
                             .subhead
                             .merge(TextStyle(fontSize: 12.0)))
                   ],
                 ),
               )
             ],
           ));
     }, childCount: prdList.length),
   );
 }
  }



