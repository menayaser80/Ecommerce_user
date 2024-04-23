class AppLink {
// static const String server="https://47bd-197-43-2-16.ngrok-free.app/ecommerce";
// // static const String server="http://localhost/ecommerce";
//   static const String imageststatic = "https://47bd-197-43-2-16.ngrok-free.app/ecommerce/upload";
  static const String server="mena";
// static const String server="http://localhost/ecommerce";
  static const String imageststatic = "mena";
//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
static const String test= "$server/test.php";
// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodessignup = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

  // ================================= ForgetPassword ========================== //


  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";

  // Home

  static const String homepage = "$server/home.php"  ;
  // items
  static const String items = "$server/items/items.php"  ;
  static const String searchitems = "$server/items/search.php";
  // Favorite

  static const String favoriteAdd = "$server/favourite/add.php";
  static const String favoriteRemove = "$server/favourite/remove.php";
  static const String favoriteView = "$server/favourite/view.php";
  static const String deletefromfavourite = "$server/favourite/deletefromfavroite.php";
  // Cart
  static const String cartview   = "$server/cart/view.php";
  static const String cartadd    = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";
  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";
  // Coupon

  static const String checkcoupon  = "$server/coupon/check.php";
  // Checkout

  static const String checkout  = "$server/orders/checkout.php";
  static const String ordersarchive  = "$server/orders/archive.php";
  static const String pendingorders  = "$server/orders/pending.php";
  static const String ordersdetails  = "$server/orders/details.php";
  static const String ordersdelete  = "$server/orders/delete.php";
  static const String notification = "$server/notification.php";
// offers
  static const String offers = "$server/offers.php";
  static const String rating = "$server/rating.php";

}
