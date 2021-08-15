import 'package:get/get.dart';
import 'package:ridethebee/app/modules/login/views/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

  final count = 0.obs;

  String accessToken = "";
  String name = "";
  String email = "";
  String urlImage = "";
  String phone = "";

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void loadUser(){
    SharedPreferences.getInstance().then((prefs){
      name = prefs.getString("name") ?? "";
      email = prefs.getString("email") ?? "";
      urlImage = prefs.getString("img") ?? "";
      phone = prefs.getString("contact") ?? "";
      accessToken = prefs.getString("access_token") ?? "";
      update(["profile"]);
    });
  }

  void logout(){
    SharedPreferences.getInstance().then((prefs){
      prefs.remove("access_token");
      prefs.remove("name");
      prefs.remove("id");
      prefs.remove("email");
      prefs.remove("contact");
      prefs.remove("img");
      prefs.remove("provider");
      prefs.remove("os");
      prefs.remove("uid");
      prefs.remove("remarks");
      prefs.remove("last_active");
      prefs.remove("status");
      prefs.remove("created_at");
      prefs.remove("is_remember");
      prefs.remove("remember_email");
      prefs.remove("remember_password");
      prefs.remove("company_id");
      prefs.remove("pickup_points");
      prefs.remove("dropoff_points");
      prefs.clear();
      Get.back();
      Get.offAll(() => LoginView());
    });
  }
}
