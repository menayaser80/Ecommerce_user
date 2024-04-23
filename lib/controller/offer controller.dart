import 'package:ecommerce_wael/controller/homecontroller.dart';
import 'package:ecommerce_wael/core/class/statusrequest.dart';
import 'package:ecommerce_wael/core/functions/handingdatacontroller.dart';
import 'package:ecommerce_wael/data/datasource/remote/offers%20data.dart';
import 'package:ecommerce_wael/data/model/items%20model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Offercontroller extends SearchMixController {
  OfferData offerData = OfferData(Get.find());

  List <ItemsModel>data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        List responcedata=response['data'];
        data.addAll(responcedata.map((e) => ItemsModel.fromJson(e)));
        print(data.length);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  void onInit() {
    search=TextEditingController();
    getData();
    super.onInit();
  }
}