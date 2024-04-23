import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_wael/controller/favourite%20controller.dart';
import 'package:ecommerce_wael/controller/itemscontroller.dart';
import 'package:ecommerce_wael/controller/offer%20controller.dart';
import 'package:ecommerce_wael/core/constant/color.dart';
import 'package:ecommerce_wael/core/constant/imgaeasset.dart';
import 'package:ecommerce_wael/core/functions/translateData.dart';
import 'package:ecommerce_wael/data/model/items%20model.dart';
import 'package:ecommerce_wael/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsoffer extends GetView<Offercontroller> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItemsoffer({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                          AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          translateDatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPriceDiscount} \$",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller.isFavorite[itemsModel.itemsId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "0");
                                      controller
                                          .removeFavorite(itemsModel.itemsId!);
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "1");
                                      controller.addFavorite(itemsModel.itemsId!);
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId] == "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      )
                    ]),
              ),
              if(itemsModel.itemsDiscount!="0")   Positioned(
                  left: 4,
                  top: 4,
                  child: Image.asset(AppImageAsset.saleOne,width: 40,))
            ],
          ),
        ));
  }
}
