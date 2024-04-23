import 'package:ecommerce_wael/core/class/statusrequest.dart';
import 'package:ecommerce_wael/core/constant/routes.dart';
import 'package:ecommerce_wael/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_wael/core/services/services.dart';
import 'package:ecommerce_wael/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData=LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  MyServices myServices=Get.find();
  StatusRequest? statusRequest=StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login()async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await loginData.postdata(
          password.text, email.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          myServices.sharedPreferences.setString("id", response['data']['users_id'].toString()) ;
          String userid =  myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences.setString("username", response['data']['users_name']) ;
          myServices.sharedPreferences.setString("email", response['data']['users_email']) ;
          myServices.sharedPreferences.setString("phone", response['data']['users_phone']) ;
          myServices.sharedPreferences.setString("step","2") ;
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");
          Get.offNamed(AppRoute.homepage ,
          );
        } else {
          Get.defaultDialog(title: "ُWarning" ,
              middleText: "Email Or Password Not Correct") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
