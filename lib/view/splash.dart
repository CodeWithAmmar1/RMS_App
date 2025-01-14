import 'package:app/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({super.key}) {
    Get.put(SplashController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/wall.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Center(
          child: Text(
            "D A M P E R",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ],
    ));
  }
}
