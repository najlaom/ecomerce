import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryService {
  String baseurl ="http://10.0.2.2:8080/";
  Future getCategory() async {

    var url = baseurl+'api/categorys/all';
    print(url);
    var searchResponse = await http.get(url);
    if (searchResponse.statusCode == 201) {
      var jsonResp = json.decode(searchResponse.body);
    if (jsonResp["success"] == true && jsonResp["data"].length > 0) {
        return jsonResp["data"];
      } else
        return [];
    } else
      return [];
  }
}
