import 'package:e_spor_salonu/model/product.dart';
import 'package:e_spor_salonu/model/user.dart';
import 'package:e_spor_salonu/view/account_view.dart';
import 'package:e_spor_salonu/view/login_view.dart';
import 'package:e_spor_salonu/view/main_view.dart';
import 'package:e_spor_salonu/view/payment_view.dart';
import 'package:e_spor_salonu/view/product_view.dart';
import 'package:e_spor_salonu/view/purchase_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  static List<User> userList = [];
  static User user = User();
  static Product product = Product();
  // static String ip = "192.168.1.127";
  static String ip = "10.16.8.220";

  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      initialRoute: "/",
      routes: {
        "/": (context) => LoginView(),
        "/main": (context) => MainView(),
        "/account": (context) => AccountView(),
        "/product": (context) => ProductView(),
        "/payment": (context) => PaymentView(),
        "/purchase": (context) => PurchaseView(),
      },
    );
  }

  static TextEditingController controller(String text) {
    TextEditingController controller = TextEditingController();
    controller.text = text;
    return controller;
  }

  static String dateToString(DateTime? date) {
    if (date != null) {
      return DateFormat("dd/MM/yyyy HH:dd").format(date);
    }
    return "";
  }

  static String monthYearString(DateTime? date, {String? m = ""}) {
    if (date != null) {
      if(m==""){
        m=DateFormat("M").format(date);
      }
      String month = monthString(m);
      String year = DateFormat("yyyy").format(date);
      return "${month} ${year}";
    }
    return "";
  }

  static String monthString(String? m) {
    switch (m) {
      case "1":
        return "Ocak";
      case "2":
        return "Şubat";
      case "3":
        return "Mart";
      case "4":
        return "Nisan";
      case "5":
        return "Mayıs";
      case "6":
        return "Haziran";
      case "7":
        return "Temmuz";
      case "8":
        return "Ağustos";
      case "9":
        return "Eylül";
      case "10":
        return "Ekim";
      case "11":
        return "Kasım";
      case "12":
        return "Aralık";
      default:
        return "Bilinmeyen Ay";
    }
  }
}