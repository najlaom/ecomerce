import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryService {
  Future getCategory() async {
    //najla
    var url = 'http://10.0.2.2:8080/api/categorys/all';
    var searchResponse = await http.get(url);
    // print(searchResponse.body);
    //najla
    if (searchResponse.statusCode == 201) {
      //  print(searchResponse.body);
      var jsonResp = json.decode(searchResponse.body);
      //  print("aaaaaaaaaaaaaaaa");
      //   print(jsonResp.toString());
   // Najla   if (jsonResp["success"] == true && jsonResp["data"].length > 0) /////
      if (jsonResp != null) {
        //   print(jsonResp["data"].toString());
        ///jsonResp["data"].sublist(1, 3);
        return jsonResp;
      } else
        return [];
    } else
      return [];
  }
}
