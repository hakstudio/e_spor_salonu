import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/user.dart';
import 'package:e_spor_salonu/view_model/login_view_model.dart';
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

  bool visibleLogin = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    usernameController.text = "69433239784";
    passwordController.text = "05413522575";
    return Scaffold(
      appBar: AppBar(title: Text("Kullanıcı Girişi")),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(Icons.person, size: 100),
                TextFieldWidget(usernameController, "Kullanıcı Adı"),
                TextFieldWidget(passwordController, "Şifre", obscureText: true),
                Visibility(
                  visible: visibleLogin,
                  child: ButtonWidget(Icons.login, "Giriş Yap", () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Lütfen bekleyiniz...")));
                    setState(() {
                      visibleLogin = false;
                    });
                    LoginViewModel loginvm = LoginViewModel();
                    Main.userList = await loginvm.getUserList();
                    bool isLogin = false;
                    for (User user in Main.userList) {
                      if (user.tc == usernameController.text.trim()) {
                        String inputTel = passwordController.text.trim();
                        if (user.fathersPhone == inputTel ||
                            user.mothersPhone == inputTel) {
                          isLogin = true;
                          Main.user = user;
                          break;
                        }
                      }
                    }
                    setState(() {
                      visibleLogin = true;
                    });
                    if (isLogin) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/main", (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Kullanıcı Adı veya Şifre Yanlış!")));
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
