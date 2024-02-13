import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/user.dart';
import 'package:e_spor_salonu/service/http_service.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return Scaffold(
        appBar: AppBar(
          title: Text("Hesap"),
        ),
        body: Center(
          child: FutureBuilder(
            future: httpService.user(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User? user = snapshot.data;
                if (user == null) {
                  return TextWidget("Kullanıcı Bulunamadı",
                      size: 20, bold: true);
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(children: [
                      InkWell(child: Icon(Icons.person, size: 100),
                      onTap: () {

                      },),
                      TextFieldWidget(Main.controller(user.tc!), "TC"),
                      TextFieldWidget(Main.controller(user.name!), "Ad"),
                      TextFieldWidget(Main.controller(user.surname!), "Soyad"),
                      TextFieldWidget(
                          Main.controller(
                              "${Main.dateToString(user.birthDate)}"),
                          "Doğum Tarihi"),
                      TextFieldWidget(
                          Main.controller(user.fathersName!), "Baba Adı"),
                      TextFieldWidget(
                          Main.controller(user.mothersName!), "Anne Adı"),
                      TextFieldWidget(
                          Main.controller(user.fathersPhone!), "Baba Telefonu"),
                      TextFieldWidget(
                          Main.controller(user.mothersPhone!), "Anne Telefonu"),
                      TextFieldWidget(Main.controller(user.address!), "Adres"),
                      TextFieldWidget(
                          Main.controller(user.description!), "Açıklama"),
                      TextFieldWidget(
                          Main.controller(user.branch.toString()), "Branş"),
                      TextFieldWidget(
                          Main.controller(user.subBranch.toString()),
                          "Alt Branş"),
                      TextFieldWidget(
                          Main.controller(user.generation.toString()), "Kuşak"),
                      TextFieldWidget(
                          Main.controller(user.coach.toString()), "Antrenör"),
                      TextFieldWidget(
                          Main.controller(user.registrationDate.toString()),
                          "Kayıt Tarihi"),
                      TextFieldWidget(
                          Main.controller(user.status.toString()), "Durum"),
                      TextFieldWidget(
                          Main.controller(user.licenseId.toString()),
                          "Lisans No"),
                      TextFieldWidget(
                          Main.controller(user.licenseYear.toString()),
                          "Lisans Yılı"),
                      TextFieldWidget(Main.controller(user.dues.toString()),
                          "Aidat Tutarı"),
                    ]),
                  ),
                );
              } else if (snapshot.hasError) {
                return TextWidget("Hata: ${snapshot.error}",
                    size: 20, bold: true);
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
