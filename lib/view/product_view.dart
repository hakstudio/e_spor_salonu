import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/product.dart';
import 'package:e_spor_salonu/service/http_service.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return Scaffold(
        appBar: AppBar(title: Text("Paket Bilgileri")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: httpService.productList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var productList = snapshot.data ?? [];
                  if (productList.isEmpty) {
                    return TextWidget("Paket Bilgileri Bulunamadı",
                        size: 20, bold: true);
                  }
                  return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      Product product = productList[index];
                      DateTime? endDate = product.endDate;
                      return ExpansionTile(
                        leading: Icon(Icons.shopping_cart_outlined),
                        title: Text(
                            "${Main.monthYearString(endDate)} Bitişli Paket"),
                        children: [
                          TextFieldWidget(
                              Main.controller("${product.product}"), "Paket"),
                          TextFieldWidget(
                              Main.controller("${product.price}"), "Tutar"),
                          TextFieldWidget(
                              Main.controller(
                                  Main.dateToString(product.startDate)),
                              "Başlangıç Tarihi"),
                          TextFieldWidget(
                              Main.controller(
                                  Main.dateToString(product.endDate)),
                              "Bitiş Tarihi"),
                          TextFieldWidget(
                              Main.controller(
                                  Main.dateToString(product.leaveStartDate)),
                              "İzin Başlangıç Tarihi"),
                          TextFieldWidget(
                              Main.controller(
                                  Main.dateToString(product.leaveEndDate)),
                              "İzin Bitiş Tarihi"),
                        ],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return TextWidget("Hata: ${snapshot.error}",
                      size: 20, bold: true);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }
}
