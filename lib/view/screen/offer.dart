import 'package:ecommerce_wael/controller/favourite%20controller.dart';
import 'package:ecommerce_wael/controller/offer%20controller.dart';
import 'package:ecommerce_wael/core/class/handling_data.dart';
import 'package:ecommerce_wael/core/constant/routes.dart';
import 'package:ecommerce_wael/view/screen/Home.dart';
import 'package:ecommerce_wael/view/widget/Home/customappbar.dart';

import 'package:ecommerce_wael/view/widget/offer/offer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Offercontroller controller= Get.put(Offercontroller());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return  GetBuilder<Offercontroller>(
        builder: (controller)=>Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              CustomAppBar(
                mycontroller: controller.search!,
                titleappbar: "Find Product",
                // onPressedIcon: () {},
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onChangedpress: (val) {
                  controller.checkSearch(val);
                },
                onPressedIconFavorite: () {
                  Get.toNamed(AppRoute.myfavroite);
                },
              ),
              SizedBox(
                height: 20,
              ),
          !controller.isSearch?HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index)=>CustomListItemsoffer(
                    itemsModel:controller.data[index],
                  ),
                  itemCount:controller.data.length ,
                ) ,
                ):ListItemsSearch(listdatamodel: controller.listdata)
            ],
          ),
        ),


    );
  }
}
