import 'package:get/get.dart';

class ReviewController extends GetxController {

  final count = 0.obs;
  int starCount = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void setStar(int star){
    starCount = star;
    update(["star"]);
  }
}
