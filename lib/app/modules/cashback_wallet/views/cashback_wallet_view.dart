import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/cashback_wallet/views/tabs/earned_tab.dart';
import 'package:ridethebee/app/modules/cashback_wallet/views/tabs/redeemed_tab.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';
import 'package:ridethebee/app/modules/notification/views/notification_view.dart';

import '../controllers/cashback_wallet_controller.dart';

class CashbackWalletView extends GetView<CashbackWalletController> {

  CashbackWalletController _cashbackWalletController = Get.put(CashbackWalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 285,
              child: Column(
                children: [
                  Expanded(child: Container(
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          child: Image.asset("assets/img_menu_background.png",
                              width: double.maxFinite,
                              height: double.maxFinite,
                              fit: BoxFit.fill),
                        ),

                        Column(
                          children: [
                            SizedBox(height: MyConstant.headerTopMargin),
                            Row(
                              children: [
                                SizedBox(width: 10),

                                GestureDetector(
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Image.asset("assets/ic_menu.png",
                                          height: 28, width: 28),
                                    ),
                                  ),
                                  onTap: (){
                                    Get.to(MenusView());
                                  },
                                ),

                                Expanded(child: SizedBox(),flex: 1),

                                Text("Cashback Wallet", style: TextStyle(
                                    color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 18,
                                  fontFamily: "PoppinsBold",
                                )),

                                Expanded(child: SizedBox(),flex: 1),

                                GestureDetector(
                                  child: Container(
                                    width: 55,
                                    height: 55,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Image.asset("assets/ic_notification.png",
                                          height: 28, width: 28),
                                    ),
                                  ),
                                  onTap: (){
                                    Get.to(NotificationView());
                                  },
                                ),

                                SizedBox(width: 10),
                              ],
                            ),

                            SizedBox(height: 8),

                            Text("Total Wallet Balance", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 14,
                                fontFamily: "PoppinsMedium",
                            )),

                            SizedBox(height: 8),

                            GetBuilder<CashbackWalletController>(
                                id: "balance",
                                init: CashbackWalletController(),
                                builder: (value) => Text("RM${value.cashbackBalance}", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 36,
                                fontFamily: "PoppinsBold"
                            )))
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                  ), flex: 1),

                  Container(
                    width: double.maxFinite,
                    height: 75,
                    child:  TabBar(
                      controller: _cashbackWalletController.tabController,
                      unselectedLabelColor: Color.fromRGBO(63, 61, 86, 1.0),
                      unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "PoppinsMedium"
                      ),
                      labelColor: Color.fromRGBO(255, 205, 56, 1.0),
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: "PoppinsBold"
                      ),
                      indicatorColor: Color.fromRGBO(255, 205, 56, 1.0),
                      indicatorWeight: 3.0,
                      tabs: <Widget>[
                        new Tab(text: "Earned"),
                        new Tab(text: "Redeemed"),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromRGBO(234, 237, 241, 1.0)
                  )
              ),
            ),

            Expanded(child: TabBarView(
              controller: _cashbackWalletController.tabController,
              children: [
                EarnedTab(this._cashbackWalletController),
                RedeemedTab(this._cashbackWalletController),
              ],
            ),flex: 1)
          ],
        ),
      ),
    );
  }
}
