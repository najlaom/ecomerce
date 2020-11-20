import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler

{
  String baseurl ="http://192.168.1.4:8085/";
  var log = Logger();
  Future get(String url) async {
    url =formater(url);
    //user registre
    var response = await http.get(url);
    if(response.statusCode == 200||response.statusCode == 201){
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);

  }

  Future<http.Response> post(String url,Map<String,String>body)async{

    url =formater(url);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body));
    log.i(response.body);
    log.i(response.statusCode);
    return response;


  }
  Future getUser(String url,String token) async {
    url =formater(url);
    log.i(url);
    String basicAuth = "Bearer "+token;
    var response = await http.get(url,
        headers: {'authorization': basicAuth});
    if(response.statusCode == 200 || response.statusCode == 201){
      log.i(response.body);
      return json.decode(response.body);
    }

  }
  Future<http.Response> put(String url,Map<String,String>body,String token)async{

    url =formater(url);
    String basicAuth = "Bearer "+token;
    var response = await http.put(url,
        headers: {"Content-Type": "application/json",'authorization': basicAuth},
        body: json.encode(body));
    log.i(response.body);
    log.i(response.statusCode);
    return response;


  }

  String formater (String url){
    return baseurl+url;
  }
}