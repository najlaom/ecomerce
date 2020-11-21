import 'package:ecomerce/models/event_model.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:flutter/material.dart';

import 'package:ecomerce/screens/chat/chat.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  _MessageListState createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context, snapshot){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text('Messenger'),
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
                            child: Container(
                              decoration: new BoxDecoration(
                                color: Colors.orange.shade700,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                bloc.allItems.length.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ))
                            : Container()
                      ],
                    ),
                  ),
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0)),
                              child: ListView.builder(
                                  itemCount: events.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final Event event = events[index];
                                    return GestureDetector(
                                      onTap: () => Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (_) =>Chat(
                                                user: event.sender,
                                              )
                                          )),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 5.0, bottom: 5.0, right: 20.0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 10.0),
                                        decoration: BoxDecoration(
                                            color: event.unread
                                                ? Color(0xFFFFEFEE)
                                                : Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20.0),
                                                bottomRight: Radius.circular(20.0))),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    CircleAvatar(
                                                      radius: 35.0,
                                                      backgroundImage:
                                                      AssetImage(event.sender.imageUrl),
                                                    ),
                                                    SizedBox(
                                                      width: 10.0,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          event.sender.name,
                                                          style: TextStyle(
                                                              color: Colors.grey,
                                                              fontSize: 15.0,
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(context).size.width * 0.45,
                                                          child: Text(
                                                            event.text,
                                                            style: TextStyle(
                                                                color: Colors.blueGrey,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                FontWeight.w600),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      event.time,
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 15.0,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    event.unread ?Container(
                                                      width: 40.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                          color: Theme.of(context).primaryColor,
                                                          borderRadius: BorderRadius.circular(30.0)
                                                      ),
                                                      child: Text('New',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.0,
                                                            fontWeight: FontWeight.bold
                                                        ),),
                                                      alignment: Alignment.center,
                                                    ) : SizedBox.shrink(),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}