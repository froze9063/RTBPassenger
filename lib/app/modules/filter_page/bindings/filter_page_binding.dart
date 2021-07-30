import 'package:get/get.dart';

import '../controllers/filter_page_controller.dart';

class FilterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterPageController>(
      () => FilterPageController(),
    );
  }
}
