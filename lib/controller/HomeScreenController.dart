import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_wael/view/screen/Home.dart';
import 'package:ecommerce_wael/view/screen/notification.dart';
import 'package:ecommerce_wael/view/screen/offer.dart';
import 'package:ecommerce_wael/view/screen/setting.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    NotificationView(),
    OfferScreen(),
    Settang(),
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "notification", "icon": Icons.notifications_active_outlined},
    {"title": "offers", "icon": Icons.offline_bolt_outlined},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}