import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/payment.dart';
import 'package:e_spor_salonu/view_model/payment_view_model.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  PaymentViewModel paymentvm = PaymentViewModel(Main.user.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tahsilat Bilgileri")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: paymentvm.getPaymentList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Payment> data = snapshot.data ?? [];
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    Payment payment = data[index];
                    return ExpansionTile(
                      leading: Icon(Icons.payment),
                      title: Text(Main.monthYearString(payment.date) +
                          " Tahsilat Bilgileri"),
                      children: [
                        TextFieldWidget(
                            Main.controller("${Main.dateToString(payment.date)}"), "Ödeme Tarihi"),
                        TextFieldWidget(
                            Main.controller("${Main.monthYearString(payment.date,m: payment.period)}"), "Dönem"),
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
        ));
  }
}
