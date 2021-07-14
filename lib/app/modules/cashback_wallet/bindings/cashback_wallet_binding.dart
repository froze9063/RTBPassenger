import 'package:get/get.dart';

import '../controllers/cashback_wallet_controller.dart';

class CashbackWalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CashbackWalletController>(
      () => CashbackWalletController(),
    );
  }
}
