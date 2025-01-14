import 'package:get/get.dart';

class Menu1Controller extends GetxController {
  RxBool isRed = true.obs;
  RxBool isRed1 = true.obs;
  RxBool isRed2 = true.obs;
  RxBool isRed3 = true.obs;
  void toggleButton() {
    isRed.value = !isRed.value;
  }

  void toggleButton1() {
    isRed1.value = !isRed1.value;
  }

  void toggleButton2() {
    isRed2.value = !isRed2.value;
  }

  void toggleButton3() {
    isRed3.value = !isRed3.value;
  }
}
