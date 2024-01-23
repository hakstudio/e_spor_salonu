import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              TextFieldWidget(Main.controller(Main.user.tc!), "TC"),
              TextFieldWidget(Main.controller(Main.user.name!), "Ad"),
              TextFieldWidget(Main.controller(Main.user.surname!), "Soyad"),
              TextFieldWidget(
                  Main.controller("${Main.dateToString(Main.user.birthDate)}"), "Doğum Tarihi"),
              TextFieldWidget(
                  Main.controller(Main.user.fathersName!), "Baba Adı"),
              TextFieldWidget(
                  Main.controller(Main.user.mothersName!), "Anne Adı"),
              TextFieldWidget(
                  Main.controller(Main.user.fathersPhone!), "Baba Telefonu"),
              TextFieldWidget(
                  Main.controller(Main.user.mothersPhone!), "Anne Telefonu"),
              TextFieldWidget(Main.controller(Main.user.address!), "Adres"),
              TextFieldWidget(
                  Main.controller(Main.user.description!), "Açıklama"),
              TextFieldWidget(
                  Main.controller(Main.user.branch.toString()), "Branş"),
              TextFieldWidget(
                  Main.controller(Main.user.subBranch.toString()), "Alt Branş"),
              TextFieldWidget(
                  Main.controller(Main.user.generation.toString()), "Kuşak"),
              TextFieldWidget(
                  Main.controller(Main.user.coach.toString()), "Antrenör"),
              TextFieldWidget(
                  Main.controller(Main.user.registrationDate.toString()),
                  "Kayıt Tarihi"),
              TextFieldWidget(
                  Main.controller(Main.user.status.toString()), "Durum"),
              TextFieldWidget(
                  Main.controller(Main.user.licenseId.toString()), "Lisans No"),
              TextFieldWidget(Main.controller(Main.user.licenseYear.toString()),
                  "Lisans Yılı"),
              TextFieldWidget(
                  Main.controller(Main.user.dues.toString()), "Aidat Tutarı"),
            ]),
          ),
        ),
      ),
    );
  }
}
