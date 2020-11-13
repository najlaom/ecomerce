import 'package:ecomerce/services/category_service.dart';
import 'package:ecomerce/services/product_service.dart';
import 'package:ecomerce/widgets/category_item.dart';
import 'package:flutter/material.dart';

class ListRequest extends StatefulWidget {
  @override
  _ListRequestState createState() => _ListRequestState();
}

class _ListRequestState extends State<ListRequest> {
  String description = "";
  @override
  void initState() {
    super.initState();
    _getAllRequests();
  }

  var requestList = [];
  _getAllRequests() async {
    print("_getAllRequests");
    var requests = await CategoryService().getCategory();
    print("requests.toString()");
    print(requests.toString());
    if (requests.length > 0) {
      setState(() {
        requestList = requests;
      });
    } else {
      setState(() {
        requestList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: List.generate(requestList.length, (index) {
                return Center(
                  child: ChoiceCard(
                    title: requestList[index]["name"].toString(),
                    //selected: requestList[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(choice: requestList[index]["id"].toString())),
                      );
                    },
                  ),
                );
              }))),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  String title;
  final bool selected;
  final VoidCallback onTap;

  ChoiceCard({this.title, this.onTap, this.selected: false});
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              new Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.directions_car,
                    size: 80.0,
                    color: textStyle.color,
                  )),
              new Expanded(
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: null,
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  )),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )),
    );
  }
}
class Detail extends StatefulWidget {
  String choice;
  Detail({this.choice});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    _getProductsByDetails();
  }

  var product = {};
  _getProductsByDetails() async {
    print("_fetchProducts");
    var productDetails = await ProductService()
        .getProductByDetails(this.widget.choice.toString());
    print(productDetails.toString());
    if (productDetails.length > 0) {
      setState(() {
        product = productDetails;
      });
      print(product.toString());
    } else {
      setState(() {
        product = {};
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor:  Color(0xFFBc82228),
      ),
      body: Column(
        children: <Widget>[
          Text(product["prix"].toString()),
          Column(
            children: [
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
