import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/menus/views/menus_view.dart';

import '../controllers/ticket_details_controller.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 165, left: 42, right: 42),
              width: double.maxFinite,
              height: 535,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Image.asset("assets/img_circle_rtb.png", height: 55, width: 55, fit: BoxFit.cover)
                    ]),

                    Row(
                      children: [
                        SizedBox(width: 24),
                        Text("Fri, 14 Sep", style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )
                        )
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(width: 24),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("Kuala Lumpur", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(), flex: 1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Depart", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("10:15 AM", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(width: 24),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("Kuala Lumpur", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(), flex: 1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Depart", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("10:15 AM", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                      ],
                    ),

                    SizedBox(height: 36),

                    Row(
                      children: [
                        SizedBox(width: 24),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Driver Name", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("John Travis", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(), flex: 1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Depot", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("Bay 5", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        SizedBox(width: 24),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Company", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("RIDE THE BEE", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox(), flex: 1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Depart", style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                            )
                            ),

                            SizedBox(height: 4),

                            Text("15", style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            )
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 36, right: 36, top: 55),
                      child: Image.asset("assets/img_barcode.png"),
                    )

                  ],
                ),
              ),
            ),

            Container(
              width: double.maxFinite,
              height: 135,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1,
                      color: Color.fromRGBO(220, 220, 220, 1.0)
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(25))
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 24),

                    GestureDetector(
                      child: Image.asset("assets/ic_menu.png", height: 28, width: 28),
                      onTap: (){
                        Get.to(MenusView());
                      },
                    ),

                    Expanded(child: SizedBox(),flex: 1),

                    Text("Ticket Details", style: TextStyle(
                        color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),

                    Expanded(child: SizedBox(),flex: 1),

                    Image.asset("assets/ic_notification.png", height: 28, width: 28),

                    SizedBox(width: 24),
                  ],
                ),
              ),
            ),

            Positioned.fill(child: Align(
              child: GestureDetector(
                child: Container(
                  width: double.maxFinite,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 205, 56, 1.0),
                      border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(220, 220, 220, 1.0)
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                          topRight: Radius.circular(25))
                  ),
                  child: Center(
                    child: Text("Back", style: TextStyle(
                        color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
                        fontWeight: FontWeight.w500
                    )),
                  ),
                ),
                onTap: (){
                  Get.back();
                },
              ),
              alignment: Alignment.bottomCenter,
            ),
            ),

          ],
        ),
      ),
    );
  }
}
