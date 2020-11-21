import 'package:ecomerce/models/model.dart';
import 'package:ecomerce/screens/product/add_product.dart';
import 'package:ecomerce/services/bloc/cart_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Chat extends StatefulWidget {
  final User user;
  Chat({this.user});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  _buildMessage(Event message, bool isMe) {
    final msg = Container(
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).primaryColorLight : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0)
        ) :
        BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message.time,
            style: TextStyle(
              color: Colors.black26,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if(isMe) {
      return msg ;
    }
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child:CircleAvatar(
            radius:18.0,
            backgroundImage: AssetImage(widget.user.imageUrl),
          ),
        ),
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked ? Colors.redAccent : Colors.blueGrey,
          onPressed: (){

          },
        ),
      ],
    );
  }
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){

            },
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value){
                setState(() {

                });
              },
              decoration: InputDecoration.collapsed(
                  hintText: 'Send a message ....'
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){

            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: bloc.allItems,
        stream: bloc.getStream,
        builder: (context, snapshot){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              title: Text(widget.user.name),
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
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child:Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: ListView.builder(
                          reverse: true,
                          padding: EdgeInsets.only(top: 15.0),
                          itemCount: messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Event message = messages[index];
                            final bool isMe = message.sender.id == currentUser.id;
                            return _buildMessage(message, isMe);
                          },
                        ),
                      ),
                    ),
                  ),
                  _buildMessageComposer(),
                ],
              ),
            ),
          );
        });
  }
}