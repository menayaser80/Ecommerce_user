import 'package:ecommerce_wael/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCoupon({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}