import 'package:ecommerce_wael/core/constant/routes.dart';
import 'package:ecommerce_wael/core/middleware/mymiddleware.dart';
import 'package:ecommerce_wael/view/Address/Add.dart';
import 'package:ecommerce_wael/view/Address/AddDetails.dart';
import 'package:ecommerce_wael/view/Address/view.dart';
import 'package:ecommerce_wael/view/screen/Home_Screen.dart';
import 'package:ecommerce_wael/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_wael/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_wael/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerce_wael/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_wael/view/screen/auth/login.dart';
import 'package:ecommerce_wael/view/screen/auth/signup.dart';
import 'package:ecommerce_wael/view/screen/auth/success_signup.dart';
import 'package:ecommerce_wael/view/screen/auth/verifycodesignup.dart';
import 'package:ecommerce_wael/view/screen/cart.dart';
import 'package:ecommerce_wael/view/screen/checkout.dart';
import 'package:ecommerce_wael/view/screen/items.dart';
import 'package:ecommerce_wael/view/screen/language.dart';
import 'package:ecommerce_wael/view/screen/onboarding.dart';
import 'package:ecommerce_wael/view/screen/orders/archive.dart';
import 'package:ecommerce_wael/view/screen/orders/details.dart';
import 'package:ecommerce_wael/view/screen/orders/pending.dart';
import 'package:ecommerce_wael/view/screen/productdetails.dart';

import 'package:get/get.dart';

import 'view/screen/myfavourite.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(  name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () => Cart()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),

];
 