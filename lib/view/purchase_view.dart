import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/purchase.dart';
import 'package:e_spor_salonu/service/http_service.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PurchaseView extends StatelessWidget {
  const PurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return Scaffold(
      appBar: AppBar(title: Text("Satın Alınanlar")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: httpService.purchaseList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var purchaseList=snapshot.data??[];
                if (purchaseList.isEmpty) {
                  return TextWidget("Satın Alma Bilgileri Bulunamadı",
                      size: 20, bold: true);
                }
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: purchaseList.length,
                  itemBuilder: (context, index) {
                    Purchase purchase = purchaseList[index];
                    DateTime? date = purchase.date;
                    return ExpansionTile(
                      leading: Icon(Icons.attach_money),
                      title: Text(
                          Main.monthYearString(date) + " Tarihli Satın Alım"),
                      children: [
                        TextFieldWidget(
                            Main.controller("${Main.dateToString(purchase.date)}"), "Tarih"),
                        TextFieldWidget(
                            Main.controller("${purchase.product}"), "Ürün"),
                        TextFieldWidget(
                            Main.controller("${purchase.amount}"), "Miktar"),
                        TextFieldWidget(
                            Main.controller("${purchase.type}"), "Ödeme Tipi"),
                        TextFieldWidget(
                            Main.controller("${purchase.price}"), "Birim Fiyatı"),
                        TextFieldWidget(Main.controller("${purchase.totalPrice}"),
                            "Toplam Fiyat"),
                        TextFieldWidget(
                            Main.controller("${purchase.debt}"), "Ödenen"),
                        TextFieldWidget(
                            Main.controller("${purchase.paid}"), "Kalan"),
                        TextFieldWidget(
                            Main.controller("${purchase.description}"),
                            "Açıklama"),
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return TextWidget(
                  "Hata: ${snapshot.error}",
                  size: 20,
                  bold: true,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
