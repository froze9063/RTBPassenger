import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/en_route/views/en_route_view.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/ticket_details/views/ticket_details_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/payment_successfull_controller.dart';

class PaymentSuccessfullView extends GetView<PaymentSuccessfullController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MyConstant.headerTopMargin),
                Row(
                  children: [
                    Expanded(child: SizedBox(), flex: 1),
                    GestureDetector(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.transparent,
                        child: Center(
                          child: Image.asset("assets/ic_close_black.png", height: 20, width: 20),
                        ),
                      ),
                      onTap: (){
                        Get.back();
                        Get.offAll(() => HomeView());
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 45),
                Expanded(child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Card(
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, top: 36, bottom: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Payment Successful", style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "PoppinsBold",
                                    color: Color.fromRGBO(22, 212, 98, 1.0)
                                ))
                              ],
                            ),
                            SizedBox(height: 36),
                            Text("Total Amount", style: TextStyle(
                              fontSize: 14,
                              fontFamily: "PoppinsRegular",
                              color: Color.fromRGBO(135, 141, 156, 1.0),
                            )),
                            SizedBox(height: 10),
                            Text("RM25.00", style: TextStyle(
                                fontSize: 30,
                                fontFamily: "PoppinsBold",
                                color: Color.fromRGBO(22, 212, 98, 1.0)
                            )),
                            SizedBox(height: 24),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: Color.fromRGBO(235, 235, 235, 1.0),
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(child: Text("Order Amount", style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontFamily: "PoppinsRegular"
                                )), flex: 1),
                                Text("RM35.00", style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(child: Text("No. Of Ticket", style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontFamily: "PoppinsRegular"
                                )), flex: 1),
                                Text("1 ", style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(child: Text("Used Cashback", style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontFamily: "PoppinsRegular"
                                )), flex: 1),
                                Text("RM10.00", style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                            SizedBox(height: 24),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: Color.fromRGBO(235, 235, 235, 1.0),
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(child: Text("Payment Method", style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontFamily: "PoppinsRegular"
                                )), flex: 1),
                                Text("Credit / Debit Card", style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(child: Text("Transaction ID", style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontFamily: "PoppinsRegular"
                                )), flex: 1),
                                Text("012345", style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(child: Text("Ticket ID", style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                    fontFamily: "PoppinsRegular"
                                )), flex: 1),
                                Text("543210", style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontFamily: "PoppinsMedium"
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ), flex: 1),
                SizedBox(height: 24),
                Padding(padding: EdgeInsets.only(left: 24, right: 24), child: GestureDetector(
                  child: ColoredButton(height: 55, width: double.maxFinite, title: "View Ticket",
                      color: Color.fromRGBO(255, 205, 56, 1.0)),
                  onTap: (){
                    Get.to(() => TicketDetailsView(), arguments: {"from_status" : 1});
                  },
                )),
                SizedBox(height: 24),
              ],
            ),

            Container(
              margin: EdgeInsets.only(top: 115),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/img_successfull.png", height: 55, width: 55)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
