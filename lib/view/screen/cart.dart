
import 'package:ecommerce_wael/controller/cartcontroller.dart';
import 'package:ecommerce_wael/core/class/handling_data.dart';
import 'package:ecommerce_wael/core/constant/color.dart';
import 'package:ecommerce_wael/view/widget/cart/appbarcart.dart';
import 'package:ecommerce_wael/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:ecommerce_wael/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerce_wael/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',),
      ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllerCoupon:controller.controllercoupon! ,
                onApplycoupon: (){
                  controller.checkcoupon();
                },
                price: "${cartController.priceorders}",
                discount: "${controller.discountcoupon}%",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [

                    SizedBox(height: 10),
                    TopCardCart(
                        message:
                        "You Have ${cartController.totalcountitems} Items in Your List"),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            cartController.data.length,
                                (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartController
                                      .add(cartController.data[index].itemsId!.toString());
                                  cartController.refreshPage();
                                },
                                onRemove: () async  {
                                  await cartController.delete(
                                      cartController.data[index].itemsId!.toString());
                                  cartController.refreshPage();
                                },
                                imagename:
                                "${cartController.data[index].itemsImage}",
                                name: "${cartController.data[index].itemsName}",
                                price:
                                "${cartController.data[index].itemsprice} \$",
                                count:
                                "${cartController.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}