import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  Future getProducts() async {
    var url = 'http://192.168.43.144:8080/api/products/getAll';
    //print(url);
    var searchResponse = await http.get(url);
    // print(searchResponse.body);
    if (searchResponse.statusCode == 201) {
      //  print(searchResponse.body);
      var jsonResp = json.decode(searchResponse.body);
      //  print("aaaaaaaaaaaaaaaa");
      //  print(jsonResp.toString());
      if (jsonResp["success"] == true && jsonResp["data"].length > 0) {
        //   print(jsonResp["data"].toString());
        ///jsonResp["data"].sublist(1, 3);
        return jsonResp["data"];
      } else
        return [];
    } else
      return [];
  }

  Future getProductsByCat(String categoryId) async {
    var url = 'http://192.168.43.144:8080/api/products/getAllByIdCategory/' +
        categoryId;
    print("urlllllllllllllll");
    print(url);
    var productByCat = await http.get(url);
    print("productByCat.body");
    print(productByCat);
    if (productByCat.statusCode == 201) {
      print("productByCat.body");
      print(productByCat.body);
      var jsonproductByCat = json.decode(productByCat.body);
      print("aaaaaaaaaaaaaaaa");
      print(jsonproductByCat.toString());
      if (jsonproductByCat != null) {
        print(jsonproductByCat.toString());

        ///jsonResp["data"].sublist(1, 3);
        return jsonproductByCat;
      } else
        return [];
    } else
      return [];
  }
}
