import 'package:ecommerce_wael/core/class/crud.dart';
import 'package:ecommerce_wael/linkApi.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
