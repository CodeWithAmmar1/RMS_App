import 'package:app/view/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController text = TextEditingController();
  TextEditingController pass = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool hide = true.obs;

  loginFun(context) async {
    isLoading.value = true;
    if (text.text.isEmpty || pass.text.isEmpty) {
      var snackBar = SnackBar(
        content: const Text('All fields are required'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: const Duration(seconds: 2),
      );
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: text.text, password: pass.text);

      var snackBar = SnackBar(
        content: Text('The account is login ${credential.user!.email}'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: const Duration(seconds: 1),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        Get.offAll(() => const HomePage());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        var snackBar = SnackBar(
          content: const Text('No user found for that email.'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
        );
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        var snackBar = SnackBar(
          content: const Text('Wrong password provided for that user.'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        isLoading.value = false;
      } else if (e.code == 'invalid-credential') {
        var snackBar = SnackBar(
          content: const Text('User not exist.'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        isLoading.value = false;
      } else {
        var snackBar = SnackBar(
          content: Text(e.code),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        isLoading.value = false;
      }
    } catch (e) {
      var snackBar = SnackBar(
        content: Text('error : $e'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      isLoading.value = false;
    }
  }

  gosignup() {
    Get.back();
  }

  void hideFun() {
    hide.value = !hide.value;
  }
}
