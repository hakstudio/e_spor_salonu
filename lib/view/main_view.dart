import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/widget/button_widget.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Ana Sayfa")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              ButtonWidget(
                Icons.person,
                "Hesap",
                () => Navigator.pushNamedAndRemoveUntil(
                    context, "/account", (route) => true),
                mainAxisSize: MainAxisSize.max,
              ),
              ButtonWidget(
                Icons.shopping_cart_outlined,
                "Paket Bilgileri",
                () => Navigator.pushNamedAndRemoveUntil(
                    context, "/product", (route) => true),
                mainAxisSize: MainAxisSize.max,
              ),
              ButtonWidget(
                Icons.payment,
                "Tahsilat Bilgileri",
                () => Navigator.pushNamedAndRemoveUntil(
                    context, "/payment", (route) => true),
                mainAxisSize: MainAxisSize.max,
              ),
              ButtonWidget(
                Icons.attach_money,
                "Satın Almalar",
                () => Navigator.pushNamedAndRemoveUntil(
                    context, "/purchase", (route) => true),
                mainAxisSize: MainAxisSize.max,
              ),
              ButtonWidget(
                Icons.exit_to_app,
                "İzin Bilgileri",
                    () => Navigator.pushNamedAndRemoveUntil(
                    context, "/leave", (route) => true),
                mainAxisSize: MainAxisSize.max,
              ),
              ButtonWidget(
                null,
                "Çıkış Yap",
                    () {
                  Main.login=null;
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Çıkış Yapıldı")));
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/", (route) => false);
                    },
                mainAxisSize: MainAxisSize.max,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
