import 'package:ecommerce_wael/core/class/crud.dart';
import 'package:ecommerce_wael/linkApi.dart';
class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata( String password ,String email ) async {
    var response = await crud.postData(AppLink.login, {
      "email" : email ,
      "password" : password  ,

    });
    return response.fold((l) => l, (r) => r);
  }
}