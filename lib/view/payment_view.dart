import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/payment.dart';
import 'package:e_spor_salonu/service/http_service.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return Scaffold(
        appBar: AppBar(title: Text("Tahsilat Bilgileri")),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: httpService.paymentList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var paymentList = snapshot.data ?? [];
                  if (paymentList.isEmpty) {
                    return TextWidget("Tahsilat Bilgileri Bulunamadı",
                        size: 20, bold: true);
                  }
                  return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemCount: paymentList.length,
                    itemBuilder: (context, index) {
                      Payment payment = paymentList[index];
                      return ExpansionTile(
                        leading: Icon(Icons.payment),
                        title: Text(Main.monthYearString(payment.date) +
                            " Tahsilat Bilgileri"),
                        children: [
                          TextFieldWidget(
                              Main.controller(
                                  "${Main.dateToString(payment.date)}"),
                              "Ödeme Tarihi"),
                          TextFieldWidget(
                              Main.controller(
                                  "${Main.monthYearString(payment.date, m: payment.period)}"),
                              "Dönem"),
                          TextFieldWidget(
                              Main.controller("${payment.type}"), "Ödeme Tipi"),
                          TextFieldWidget(
                              Main.controller("${payment.debt}"), "Borç"),
                          TextFieldWidget(
                              Main.controller("${payment.paid}"), "Ödenen"),
                          TextFieldWidget(
                              Main.controller("${payment.remaining}"), "Kalan"),
                          TextFieldWidget(
                              Main.controller("${payment.description}"),
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
        ));
  }
}
