import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  List allItems = [];
  _saveCart() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("cart", json.encode(allItems));
    });
  }

  initCart() async {
    SharedPreferences.getInstance();
    final prefs = await SharedPreferences.getInstance();
    var cartPref = prefs.getString("cart");
    if (cartPref != null) {
      print("cartPref");
      print(cartPref);
      var cart = json.decode(cartPref);
      if (cart != null && cart.length > 0) {
        allItems = [];
        //print("add from prefs");
        //print(cart);
        cart.forEach((c) {
          //addToCart(c);
          // print(c.toString());
          allItems.add(c);
        });
        // allItems = cart;
        //print("Cart not empty");
        cartStreamController.sink.add(allItems);
      }
    }
  }

  void emptyCart() {
    allItems = [];
    cartStreamController.sink.add(allItems);
    _saveCart();
  }

  Future<void> addToCart(item) {
    bool found = false;
    if (allItems.length > 0) {
      for (var i = 0; i < allItems.length; i++) {
        if (allItems[i] != null && allItems[i]["id"] == item["id"]) {
          found = true;
          allItems[i]["quantite"]++;
          //print ("produiiiiiiiiiiiiiiiiiiiiiiiiiit ajouté");
        }
      }
    }
    if (!found) allItems.add({...item, "quantite": 1});
    print(allItems.toString());
    _saveCart();
    cartStreamController.sink.add(allItems);
  }

  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();
