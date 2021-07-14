import 'package:get/get.dart';

import '../controllers/en_route_controller.dart';

class EnRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnRouteController>(
      () => EnRouteController(),
    );
  }
}
