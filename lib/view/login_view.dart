import 'package:e_spor_salonu/service/http_service.dart';
import 'package:e_spor_salonu/widget/button_widget.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    usernameController.text = "69433239784";//69433239784:05413522575
    passwordController.text = "05413522575";
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Kullanıcı Girişi"))),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.person, size: 100),
                TextFieldWidget(usernameController, "Kullanıcı Adı"),
                TextFieldWidget(passwordController, "Şifre", obscureText: true),
                ButtonWidget(Icons.login, "Giriş Yap", () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Giriş Yapılıyor")));
                  HttpService service=HttpService();
                  bool? login=await service.login(usernameController.text, passwordController.text);
                  if (login??false) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/main", (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Kullanıcı Adı veya Şifre Yanlış!")));
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
