import 'dart:convert';

import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/leave.dart';
import 'package:e_spor_salonu/model/login.dart';
import 'package:e_spor_salonu/model/payment.dart';
import 'package:e_spor_salonu/model/product.dart';
import 'package:e_spor_salonu/model/purchase.dart';
import 'package:e_spor_salonu/model/user.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Uri loginUri = Uri.parse("${Main.server}");
  Uri userUri = Uri.parse("${Main.server}/user");
  Uri purchaseUri = Uri.parse("${Main.server}/purchase");
  Uri productUri = Uri.parse("${Main.server}/product");
  Uri paymentUri = Uri.parse("${Main.server}/payment");
  Uri leaveUri = Uri.parse("${Main.server}/leave");
  Uri leaveRequestUri = Uri.parse("${Main.server}/leave/request");
  var headers = {'Content-Type': 'application/json'};

  Future<bool?> login(String username, String password) async {
    var login = Login(username: username, password: password);
    var request = http.Request('GET', loginUri);
    request.body = json.encode(login.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      if (body == "") return null;
      if (body.startsWith("Welcome")) {
        Main.login = login;
        return true;
      }
      return false;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<User?> user() async {
    var request = http.Request('GET', userUri);
    request.body = json.encode(Main.login?.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      if (body == "") return null;
      return User.fromJson(jsonDecode(body));
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<Product>?> productList() async {
    var request = http.Request('GET', productUri);
    request.body = json.encode(Main.login?.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      if (body == "") return null;
      List list = jsonDecode(body) as List;
      print(list[0]);
      List<Product> productList = list.map((e) => Product.fromJson(e)).toList();
      return productList;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<Payment>?> paymentList() async {
    var request = http.Request('GET', paymentUri);
    request.body = json.encode(Main.login?.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      if (body == "") return null;
      List list = jsonDecode(body) as List;
      List<Payment> paymentList = list.map((e) => Payment.fromJson(e)).toList();
      return paymentList;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<Purchase>?> purchaseList() async {
    var request = http.Request('GET', purchaseUri);
    request.body = json.encode(Main.login?.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      if (body == "") return null;
      List list = jsonDecode(body) as List;
      List<Purchase> purchaseList = list.map((e) => Purchase.fromJson(e)).toList();
      return purchaseList;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<Leave>?> leaveList() async {
    var request = http.Request('GET', leaveUri);
    request.body = json.encode(Main.login?.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String body = await response.stream.bytesToString();
      if (body == "") return null;
      List list = jsonDecode(body) as List;
      List<Leave> leaveList = list.map((e) => Leave.fromJson(e)).toList();
      return leaveList;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<Leave?> leaveRequest() async{
    var request=http.Request('GET', leaveRequestUri);
    request.body=json.encode(Main.login?.toMap());
    request.headers.addAll(headers);
    http.StreamedResponse response=await request.send();
    if(response.statusCode==200){
      String body=await response.stream.bytesToString();
      if (body == "") return null;
      Leave leave=Leave.fromJson(jsonDecode(body));
      return leave;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
