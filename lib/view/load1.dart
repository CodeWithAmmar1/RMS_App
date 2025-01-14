import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Load1 extends StatelessWidget {
  const Load1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: Get.height * 0.55,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(color: Colors.blue, blurRadius: 15, spreadRadius: 6)
              ],
              image: DecorationImage(
                  image: AssetImage("asset/wall.jpg"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                width: Get.width * 0.4,
                child: Image.asset(
                  "asset/bulb.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "LOAD 1 CONTROL",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.withOpacity(0.3),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Icon(
                            Icons.minimize_rounded,
                            size: 50,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
