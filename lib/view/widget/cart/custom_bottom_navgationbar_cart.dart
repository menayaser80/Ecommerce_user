
import 'package:ecommerce_wael/controller/cartcontroller.dart';
import 'package:ecommerce_wael/core/constant/color.dart';
import 'package:ecommerce_wael/core/constant/routes.dart';
import 'package:ecommerce_wael/view/widget/cart/buttoncart.dart';
import 'package:ecommerce_wael/view/widget/cart/coupon%20button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price ;
  final String discount ;
  final String shipping;
  final String totalprice ;
 final TextEditingController controllerCoupon;
final  void Function()? onApplycoupon;
  const BottomNavgationBarCart({Key? key, required this.price, required this.discount, required this.totalprice, required this.controllerCoupon, this.onApplycoupon, required this.shipping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           GetBuilder<CartController>(builder: (controller)=>
           controller.couponname==null?
               Container(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Row(
                   children: [
                     Expanded(
                         flex: 2,
                         child: TextFormField(
                           controller: controllerCoupon,
                           decoration: InputDecoration(
                             isDense: true,
                             contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                             hintText: 'Coupon Code',

                             border: OutlineInputBorder(),
                           ),
                         )),
                     SizedBox(
                       width: 5,
                     ),
                     Expanded(
                       flex: 1,
                       child: CustomButtonCoupon(
                         textbutton:'Apply' ,
                         onPressed:onApplycoupon,
                       ),
                     ),
                   ],
                 ),
               ):Container(child: Text("Coupon Code ${controller.couponname!}",style: TextStyle(
             color: AppColor.primaryColor,
             fontWeight: FontWeight.bold,
           ),),),
           ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
color: AppColor.primaryColor,width: 1
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("price", style: TextStyle(fontSize: 16))),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$price \$", style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("discount", style: TextStyle(fontSize: 16))),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$discount ", style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Shipping", style: TextStyle(fontSize: 16))),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$shipping ", style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Total Price",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor))),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$totalprice \$",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor)))
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            CustomButtonCart(
              textbutton: "Place Order",
              onPressed: () {
controller.gotopageCheckout();
              },
            )
          ],
        ));
  }
}