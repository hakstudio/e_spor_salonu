import 'package:e_spor_salonu/main.dart';
import 'package:e_spor_salonu/model/product.dart';
import 'package:e_spor_salonu/service/http_service.dart';

class ProductViewModel{
  late HttpService service;
  ProductViewModel(int? userId){
    Uri uri = Uri.parse("http://${Main.ip}:8080/products/$userId");
    service = HttpService(uri);
  }
  Future<List<Product>> getProductList() async {
    var data = await service.get() as List;
    return data.map((e) => Product.fromJson(e)).toList();
  }
}