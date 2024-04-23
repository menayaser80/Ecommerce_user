
import 'dart:io';

import 'package:ecommerce_wael/controller/HomeScreenController.dart';
import 'package:ecommerce_wael/core/constant/color.dart';
import 'package:ecommerce_wael/core/constant/routes.dart';
import 'package:ecommerce_wael/view/widget/Home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined)),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body:WillPopScope(
            child:controller.listPage.elementAt(controller.currentpage),
            onWillPop: (){
              Get.defaultDialog(
                title: "Warning",
                titleStyle: TextStyle(
                  fontWeight: FontWeight.bold
                ),
                middleText: "Do you want to Exit app",
                  onCancel: ()
                  {

                  },
                onConfirm: (){
                  exit(0);
                }
              );
return Future.value(false);
            },
          ),
        ));
  }
}