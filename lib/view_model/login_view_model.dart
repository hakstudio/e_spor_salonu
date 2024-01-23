import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/user.dart';
import 'package:e_spor_salonu/service/http_service.dart';

class LoginViewModel {
  late HttpService service;

  LoginViewModel() {
    Uri uri = Uri.parse("http://${Main.ip}:8080/users");
    service = HttpService(uri);
  }

  Future<List<User>> getUserList() async {
    var data = await service.get() as List;
    return data.map((e) => User.fromJson(e)).toList();
  }
}
