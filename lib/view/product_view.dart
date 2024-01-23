import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/product.dart';
import 'package:e_spor_salonu/view_model/product_view_model.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductViewModel productvm = ProductViewModel(Main.user.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Paket Bilgileri")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: productvm.getProductList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> data = snapshot.data ?? [];
                return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    Product product = data[index];
                    DateTime? startDate = product.startDate;
                    return ExpansionTile(
                      leading: Icon(Icons.shopping_cart_outlined),
                      title: Text(Main.monthYearString(startDate) + " Paketi"),
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
                            Main.controller(Main.dateToString(product.endDate)),
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
