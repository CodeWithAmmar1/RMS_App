import 'package:app/view/home_page.dart';
import 'package:app/view/log_in.dart';
import 'package:app/view/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      // if (FirebaseAuth.instance.currentUser != null) {
      //   Get.offAll(() => HomePage());
      // } else {
      // }
      Get.offAll(() => SignUp());
    });
  }
}
