import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/purchase.dart';
import 'package:e_spor_salonu/service/http_service.dart';

class PurchaseViewModel{
  late HttpService service;
  PurchaseViewModel(int? userId){
    Uri uri = Uri.parse("http://${Main.ip}:8080/purchases/$userId");
    service = HttpService(uri);
  }
  Future<List<Purchase>> getPurchaseList() async {
    var data = await service.get() as List;
    return data.map((e) => Purchase.fromJson(e)).toList();
  }
}