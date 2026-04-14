import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Services{



  Future<http.Response> saveUser(String username,String email,String password) async {
    // var uri=Uri.parse("http://192.168.1.120:8080/register");
    var uri=Uri.parse("http://192.168.122.239:8080/register");

    Map<String,String> headers={
      "Content-Type":"application/json"
    };
    Map data={
      "username":username,
      "email":email,
      "password":password
    };
    var body=json.encode(data);
    var response= await http.post(uri,headers:headers,body:body);
    return response;
  }




}