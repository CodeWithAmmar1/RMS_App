import 'package:app/controller/load_controller/load1_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Damper extends StatelessWidget {
  Damper({super.key});
  final Load1Controller _load1controller = Get.put(Load1Controller());
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String image = arguments['image'] ?? '';
    final String title = arguments['title'] ?? '';
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: Get.height * 0.8,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(color: Colors.blue, blurRadius: 15, spreadRadius: 6)
              ],
              image: const DecorationImage(
                  image: AssetImage("asset/wall.jpg"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                width: Get.width * 0.4,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Text(
                "Set Point",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _load1controller.subPoint();
                        },
                        icon: const Icon(Icons.remove,
                            size: 40, color: Colors.white)),
                    Obx(
                      () => Text(
                        "${_load1controller.point}%",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _load1controller.addPoint();
                        },
                        icon: const Icon(Icons.add,
                            size: 40, color: Colors.white))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Text(
                "Supply CFM",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                height: Get.height * 0.1,
                width: Get.width * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _load1controller.subCount();
                        },
                        icon: const Icon(Icons.remove,
                            size: 40, color: Colors.white)),
                    Obx(
                      () => Text(
                        "${_load1controller.count}%",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          _load1controller.addCount();
                        },
                        icon: const Icon(Icons.add,
                            size: 40, color: Colors.white))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              SizedBox(
                width: Get.width * 0.6,
                height: Get.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    // function
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                  child: const Text(
                    "SEASON :",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              SizedBox(
                width: Get.width * 0.6,
                height: Get.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    // function
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                  child: const Text(
                    "MODE :",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
