import 'package:app/view/login-Signup/log_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool hide = true.obs;

  signupFun(BuildContext context) async {
    isLoading.value = true;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      var snackBar = SnackBar(
        content: const Text('All fields are required'),
        backgroundColor: const Color(0xffFF5A5F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    isLoading.value = true;

    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user?.uid)
            .set({
          "email": emailController.text,
          "uid": credential.user!.uid,
        });

        var snackBar = SnackBar(
          content: Text('The account is created for ${credential.user!.email}'),
          backgroundColor: const Color(0xffFF5A5F),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Future.delayed(const Duration(seconds: 1), () {
          isLoading.value = false;
          Get.off(() => Login());
        });
      } catch (firestoreError) {
        isLoading.value = false;
        var snackBar = SnackBar(
          content: Text('Firestore Error: $firestoreError'),
          backgroundColor: const Color(0xffFF5A5F),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;

      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for this email.';
      } else {
        errorMessage = 'Authentication Error: ${e.message}';
      }

      var snackBar = SnackBar(
        content: Text(errorMessage),
        backgroundColor: const Color(0xffFF5A5F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      isLoading.value = false;

      var snackBar = SnackBar(
        content: Text('Unexpected Error: $e'),
        backgroundColor: const Color(0xffFF5A5F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  gologin() {
    Get.offAll(() => const Login());
  }

  void hideFun() {
    hide.value = !hide.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
