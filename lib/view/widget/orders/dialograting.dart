import 'package:ecommerce_wael/controller/orders/archive_controller.dart';
import 'package:ecommerce_wael/core/constant/color.dart';
import 'package:ecommerce_wael/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';


void showDialogRating(BuildContext context,String ordersid)
{
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) =>  RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image:Image.asset(AppImageAsset.logo,width: 200,height: 200,),
      submitButtonTextStyle: TextStyle(
          color: AppColor.primaryColor,fontWeight: FontWeight.bold
      ),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrdersArchiveController controller=Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
       controller.submitRating(ordersid,response.rating, response.comment) ;

      },
    ),
  );
}
