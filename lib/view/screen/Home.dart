import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_wael/controller/homecontroller.dart';
import 'package:ecommerce_wael/core/class/handling_data.dart';
import 'package:ecommerce_wael/core/constant/routes.dart';
import 'package:ecommerce_wael/data/model/items%20model.dart';
import 'package:ecommerce_wael/linkApi.dart';
import 'package:ecommerce_wael/view/widget/Home/customappbar.dart';
import 'package:ecommerce_wael/view/widget/Home/customcardhome.dart';
import 'package:ecommerce_wael/view/widget/Home/customtitlehome.dart';
import 'package:ecommerce_wael/view/widget/Home/listcategorieshome.dart';
import 'package:ecommerce_wael/view/widget/Home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller=Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                CustomCardHome(
                            title: "${controller.titlehomecard}",
                            body: "${controller.bodyhomecard}"),
                        CustomTitleHome(title: "Categories"),
                        ListCategoriesHome(),
                        CustomTitleHome(title: "Top Selling"),
                        ListItemsHome(),
                      ],
                    )
                        : ListItemsSearch(listdatamodel: controller.listdata)
                )

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(listdatamodel[index].itemsName!),
                              subtitle: Text(listdatamodel[index].categoriesName!),
                            )),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}