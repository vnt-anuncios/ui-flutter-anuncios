import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt indexRx = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  change(int index) {
    indexRx.value = index;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
