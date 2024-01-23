import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/payment.dart';
import 'package:e_spor_salonu/service/http_service.dart';

class PaymentViewModel {
  late HttpService service;

  PaymentViewModel(int? userId) {
    Uri uri = Uri.parse("http://${Main.ip}:8080/payments/$userId");
    service = HttpService(uri);
  }

  Future<List<Payment>> getPaymentList() async {
    var data = await service.get() as List;
    return data.map((e) => Payment.fromJson(e)).toList();
  }
}
