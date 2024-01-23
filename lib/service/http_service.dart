import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService{
  Uri uri;
  HttpService(this.uri);

  Future<dynamic> get()async{
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    else{
      throw Exception("Failed to load user list");
    }
  }
}