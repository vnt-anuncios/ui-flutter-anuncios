import 'package:get/get.dart';

import '../controllers/favorite_page_controller.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavoritePageController>(
      FavoritePageController(),
    );
  }
}
