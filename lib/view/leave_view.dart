import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/leave.dart';
import 'package:e_spor_salonu/service/http_service.dart';
import 'package:e_spor_salonu/widget/button_widget.dart';
import 'package:e_spor_salonu/widget/text_field_widget.dart';
import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class LeaveView extends StatefulWidget {
  const LeaveView({super.key});

  @override
  State<LeaveView> createState() => _LeaveViewState();
}

class _LeaveViewState extends State<LeaveView> {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return Scaffold(
      appBar: AppBar(title: Text("İzin Bilgileri")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                  child: FutureBuilder(
                future: httpService.leaveList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var leaveList = snapshot.data ?? [];
                    if (leaveList.isEmpty) {
                      return TextWidget("İzin Bilgileri Bulunamadı",
                          size: 20, bold: true);
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(8.0),
                        itemCount: leaveList.length,
                        itemBuilder: (context, index) {
                          Leave leave = leaveList[index];
                          DateTime? date = leave.date;
                          return ExpansionTile(
                            leading: Icon(Icons.exit_to_app),
                            title: Text("${Main.monthYearString(date)} İzni"),
                            children: [
                              TextFieldWidget(
                                  Main.controller(
                                      Main.dateToString(leave.date)),
                                  "Başvuru Tarihi"),
                              TextFieldWidget(
                                  Main.controller(
                                      Main.statusString(leave.status)),
                                  "Başvuru Durumu"),
                            ],
                          );
                        });
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return TextWidget("Hata: ${snapshot.error}",
                        size: 20, bold: true);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),),
              ButtonWidget(Icons.exit_to_app, "İzin Talebi Oluştur", () async {
                Leave? leave = await httpService.leaveRequest();
                if (leave == null)
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Bağlantınızı Kontrol Edin")));
                else if (leave.id == null)
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Son Talebiniz Zaten İşlemde")));
                else {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Talebiniz İşleme Alındı")));
                  });
                }
              }, mainAxisSize: MainAxisSize.max),
            ],
          ),
        ),
      ),
    );
  }
}
