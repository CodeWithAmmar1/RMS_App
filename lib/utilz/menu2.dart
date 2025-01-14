import 'package:app/controller/menu_controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu2 extends StatelessWidget {
  final String image;
  final String text;
  final void Function() onTextTap;

  Menu2({
    super.key,
    required this.image,
    required this.text,
    required this.onTextTap,
  });
  Menu1Controller menuController = Get.put(Menu1Controller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.25,
        width: Get.width * 0.45,
        decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1,
              color: Colors.grey.withOpacity(0.5),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.1,
              width: Get.width * 0.22,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Flexible(
              child: TextButton(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: onTextTap,
              ),
            ),
            Obx(
              () => Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        menuController.isRed1.value ? Colors.red : Colors.green,
                    fixedSize: Size(90, 30),
                  ),
                  onPressed: () {
                    menuController.toggleButton1();
                  },
                  child: Text(
                    menuController.isRed1.value ? 'OFF' : 'ON',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
