import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  Future getProducts() async {
    var url = 'http://10.0.2.2:8080/api/products/getAll';
    var searchResponse = await http.get(url);
    print(searchResponse.body);
    if (searchResponse.statusCode == 201) {
      print(searchResponse.body);
      var jsonResp = json.decode(searchResponse.body);
      print("aaaaaaaaaaaaaaaa");
      print(jsonResp.toString());
      if (jsonResp["data"].length > 0) {
        print(jsonResp["data"].toString());
        ///jsonResp["data"].sublist(1, 3);
        return jsonResp["data"];
      } else
        return [];
    } else
      return [];
  }
}
