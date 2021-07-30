import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/cashback_wallet/views/cashback_wallet_view.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/my_tickets/views/my_tickets_view.dart';
import 'package:ridethebee/app/modules/profile/views/profile_view.dart';
import 'package:ridethebee/app/modules/ticket_details/views/ticket_details_view.dart';

import '../controllers/menus_controller.dart';

class MenusView extends GetView<MenusController> {

  MenusController _menusController = Get.put(MenusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 327,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              child: Image.asset("assets/img_menu_background.png",
                  width: double.maxFinite,
                  height: double.maxFinite, fit: BoxFit.fill),
            ),
          ),

         Column(
           children: [
             Padding(padding: EdgeInsets.only(top: MyConstant.headerTopMargin, left: 24,
                 right: 10), child: Row(
               children: [
                 Text("Menu", style: TextStyle(
                     fontSize: 24,
                     color: Color.fromRGBO(63, 61, 86, 1.0),
                     fontFamily: "PoppinsMedium"
                 )),

                 Expanded(child: SizedBox(), flex: 1),

                 GestureDetector(child: Container(
                   width: 55,
                   height: 55,
                   color: Colors.transparent,
                   child: Center(
                     child: Image.asset("assets/ic_close_black.png", height: 20, width: 20),
                   ),
                 ),onTap: (){
                   Get.back();
                 })
               ],
             )),

             Padding(
               padding: EdgeInsets.only(left: 24, right: 24),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 57),

                   GestureDetector(
                     child: Container(
                       width: double.maxFinite,
                       color: Colors.transparent,
                       child: Row(
                         children: [
                           Image.asset("assets/img_default_profile.png", height: 55, width: 55),
                           SizedBox(width: 16),
                           Expanded(child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("Elizabeth Tan", style: TextStyle(
                                   fontSize: 18,
                                   fontFamily: "PoppinsBold",
                                   color: Color.fromRGBO(63, 61, 86, 1.0)
                               )),
                               SizedBox(height: 4),
                               Text("elizabethtan@gmail.com", style: TextStyle(
                                   fontSize: 12,
                                   fontFamily: "PoppinsMedium",
                                   color: Color.fromRGBO(63, 61, 86, 1.0)
                               ))
                             ],
                           ), flex: 1),

                           Image.asset("assets/ic_circle_right.png", height: 24, width: 24),
                           SizedBox(width: 29)
                         ],
                       ),
                     ),
                     onTap: (){
                       Get.to(ProfileView());
                     },
                   ),

                   SizedBox(height: 24),

                   Card(
                     elevation: 1,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(12))
                     ),
                     child: Container(
                       margin: EdgeInsets.only(top: 16, bottom: 16),
                       child: Column(
                         children: [
                           GetBuilder<MenusController>(
                             id: "search_color",
                             init: MenusController(),
                             builder: (value) => GestureDetector(
                               child: Container(
                                 width: double.maxFinite,
                                 height: 75,
                                 color: _menusController.searchColor,
                                 child: Center(
                                   child: Row(
                                     children: [
                                       SizedBox(width: 24),
                                       Image.asset("assets/ic_search_trips.png", height: 24, width: 24),
                                       SizedBox(width: 16),
                                       Expanded(child: Text("Search Trips", style: TextStyle(
                                           fontSize: 14,
                                           fontFamily: "PoppinsMedium",
                                           color: Color.fromRGBO(63, 61, 86, 1.0)
                                       )), flex: 1),
                                       Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24),
                                       SizedBox(width: 24),
                                     ],
                                   ),
                                 ),
                               ),
                               onTap: (){
                                 Get.offAll(() => HomeView());
                                 value.setSearchColor(Colors.white);
                               },
                               onTapCancel: (){
                                 value.setSearchColor(Colors.white);
                               },
                               onTapUp: (text){
                                 value.setSearchColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                               onTapDown: (text){
                                 value.setSearchColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                             ),
                           ),

                           Container(
                             width: double.maxFinite,
                             height: 1,
                             color: Color.fromRGBO(240, 240, 239, 1.0),
                           ),

                           GetBuilder<MenusController>(
                             id: "cashback_color",
                             init: MenusController(),
                             builder: (value) => GestureDetector(
                               child: Container(
                                 width: double.maxFinite,
                                 height: 75,
                                 color: _menusController.cashbackColor,
                                 child: Center(
                                   child: Row(
                                     children: [
                                       SizedBox(width: 24),
                                       Image.asset("assets/ic_wallet.png", height: 24, width: 24),
                                       SizedBox(width: 16),
                                       Expanded(child: Text("Cashback Wallet", style: TextStyle(
                                           fontSize: 14,
                                           fontFamily: "PoppinsMedium",
                                           color: Color.fromRGBO(63, 61, 86, 1.0)
                                       )), flex: 1),
                                       Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24),
                                       SizedBox(width: 24),
                                     ],
                                   ),
                                 ),
                               ),
                               onTap: (){
                                 Get.to(() => CashbackWalletView());
                                 value.setCashbackColor(Colors.white);
                               },
                               onTapCancel: (){
                                 value.setCashbackColor(Colors.white);
                               },
                               onTapUp: (text){
                                 value.setCashbackColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                               onTapDown: (text){
                                 value.setCashbackColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),

                   SizedBox(height: 24),

                   Card(
                     elevation: 1,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(12))
                     ),
                     child: Container(
                       margin: EdgeInsets.only(top: 16, bottom: 16),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           Padding(padding: EdgeInsets.only(left: 24, top: 8, bottom: 8),
                               child:  Text("My Tickets", style: TextStyle(
                                   fontSize: 18,
                                   fontFamily: "PoppinsMedium",
                                   color: Color.fromRGBO(63, 61, 86, 1.0)
                               ))),

                           GetBuilder<MenusController>(
                             id: "ongoing_color",
                             init: MenusController(),
                             builder: (value) => GestureDetector(
                               child: Container(
                                 width: double.maxFinite,
                                 color: _menusController.ongoingColor,
                                 padding: EdgeInsets.only(top: 16, bottom: 16),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     SizedBox(width: 24),
                                     Image.asset("assets/ic_ongoing.png", height: 36, width: 36),
                                     SizedBox(width: 16),
                                     Expanded(child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text("Ongoing", style: TextStyle(
                                             fontSize: 14,
                                             fontFamily: "PoppinsMedium",
                                             color: Color.fromRGBO(63, 61, 86, 1.0)
                                         )),
                                         SizedBox(height: 8),
                                         Text("Kuala Lumpur - Malaysia", style: TextStyle(
                                             fontSize: 12,
                                             fontFamily: "PoppinsRegular",
                                             color: Color.fromRGBO(135, 141, 156, 1.0)
                                         ))
                                       ],
                                     ), flex: 1),
                                     Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24),
                                     SizedBox(width: 24),
                                   ],
                                 ),
                               ),
                               onTap: (){
                                 Get.to(() => TicketDetailsView());
                                 value.setOnGoing(Colors.white);
                               },
                               onTapCancel: (){
                                 value.setOnGoing(Colors.white);
                               },
                               onTapUp: (text){
                                 value.setOnGoing(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                               onTapDown: (text){
                                 value.setOnGoing(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                             ),
                           ),

                           Container(
                             width: double.maxFinite,
                             height: 1,
                             color: Color.fromRGBO(240, 240, 239, 1.0),
                           ),

                           GetBuilder<MenusController>(
                             id: "upcoming_color",
                             init: MenusController(),
                             builder: (value) => GestureDetector(
                               child: Container(
                                 width: double.maxFinite,
                                 height: 75,
                                 color: _menusController.upcomingColor,
                                 child: Center(
                                   child: Row(
                                     children: [
                                       SizedBox(width: 24),
                                       Image.asset("assets/ic_upcoming.png", height: 36, width: 36),
                                       SizedBox(width: 16),
                                       Expanded(child: Text("Upcoming", style: TextStyle(
                                           fontSize: 14,
                                           fontFamily: "PoppinsMedium",
                                           color: Color.fromRGBO(63, 61, 86, 1.0)
                                       )), flex: 1),
                                       Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24),
                                       SizedBox(width: 24),
                                     ],
                                   ),
                                 ),
                               ),
                               onTap: (){
                                 Get.to(() => MyTicketsView(), arguments: {"tab_type" : 0});
                                 value.setUpcomingColor(Colors.white);
                               },
                               onTapCancel: (){
                                 value.setUpcomingColor(Colors.white);
                               },
                               onTapUp: (text){
                                 value.setUpcomingColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                               onTapDown: (text){
                                 value.setUpcomingColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                             ),
                           ),

                           Container(
                             width: double.maxFinite,
                             height: 1,
                             color: Color.fromRGBO(240, 240, 239, 1.0),
                           ),

                           GetBuilder<MenusController>(
                             id: "completed_color",
                             init: MenusController(),
                             builder: (value) => GestureDetector(
                               child: Container(
                                 width: double.maxFinite,
                                 height: 75,
                                 color: _menusController.completedColor,
                                 child: Center(
                                   child: Row(
                                     children: [
                                       SizedBox(width: 24),
                                       Image.asset("assets/ic_completed.png", height: 36, width: 36),
                                       SizedBox(width: 16),
                                       Expanded(child: Text("Completed", style: TextStyle(
                                           fontSize: 14,
                                           fontFamily: "PoppinsMedium",
                                           color: Color.fromRGBO(63, 61, 86, 1.0)
                                       )), flex: 1),
                                       Image.asset("assets/ic_graycircle_arrow.png", height: 24, width: 24),
                                       SizedBox(width: 24),
                                     ],
                                   ),
                                 ),
                               ),
                               onTap: (){
                                 Get.to(() => MyTicketsView(), arguments: {"tab_type" : 1});
                                 value.setCompletedColor(Colors.white);
                               },
                               onTapCancel: (){
                                 value.setCompletedColor(Colors.white);
                               },
                               onTapUp: (text){
                                 value.setCompletedColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                               onTapDown: (text){
                                 value.setCompletedColor(Color.fromRGBO(235, 235, 235, 1.0).withOpacity(0.5));
                               },
                             ),
                           ),
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             )
           ],
         ),
        ],
      ),
    );
  }
}
