import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryService {
  Future getCategory() async {
    var url = 'http://192.168.43.144:8080/api/categorys/all';
    var searchResponse = await http.get(url);
    // print(searchResponse.body);
    if (searchResponse.statusCode == 201) {
      //  print(searchResponse.body);
      var jsonResp = json.decode(searchResponse.body);
      //  print("aaaaaaaaaaaaaaaa");
      //   print(jsonResp.toString());
      if (jsonResp["success"] == true && jsonResp["data"].length > 0) {
        //   print(jsonResp["data"].toString());
        ///jsonResp["data"].sublist(1, 3);
        return jsonResp["data"];
      } else
        return [];
    } else
      return [];
  }
}
