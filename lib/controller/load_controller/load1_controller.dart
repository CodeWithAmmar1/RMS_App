import 'package:get/get.dart';

class Load1Controller extends GetxController {
  RxInt count = 10.obs;
  RxInt point = 10.obs;

  void addCount() {
    if (count.value < 100) {
      count.value += 10;
    }
  }

  void subCount() {
    if (count.value > 10) {
      count.value -= 10;
    }
  }

  void addPoint() {
    if (point.value < 100) {
      point.value += 10;
    }
  }

  void subPoint() {
    if (point.value > 10) {
      point.value -= 10;
    }
  }
}
