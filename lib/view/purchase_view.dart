import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/purchase.dart';
import 'package:e_spor_salonu/view_model/purchase_view_model.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PurchaseView extends StatefulWidget {
  const PurchaseView({super.key});

  @override
  State<PurchaseView> createState() => _PurchaseViewState();
}

class _PurchaseViewState extends State<PurchaseView> {
  PurchaseViewModel purchasevm = PurchaseViewModel(Main.user.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Satın Alınanlar")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: purchasevm.getPurchaseList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Purchase> data = snapshot.data ?? [];
              return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Purchase purchase = data[index];
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
              return Center(
                child: TextWidget(
                  "Hata: ${snapshot.error}",
                  size: 20,
                  bold: true,
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
