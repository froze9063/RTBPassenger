import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/ticket_details_seat/views/ticket_details_seat_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/car_seats_controller.dart';

class CarSeatsView extends GetView<CarSeatsController> {

  CarSeatsController _carSeatsController = Get.put(CarSeatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
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
                      child: Image.asset("assets/ic_new_back_yellow.png", height: 18, width: 18),
                    ),
                  ),
                  onTap: (){
                    Get.back();
                  },
                ),
                Expanded(child: Text("Select Seats",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "PoppinsBold",
                        color: Color.fromRGBO(63, 61, 86, 1.0)
                    ))),
                GestureDetector(
                  child: Container(
                    width: 55,
                    height: 55,
                    color: Colors.transparent,
                  ),
                  onTap: (){
                    Get.back();
                  },
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset("assets/img_available_seat.png", width: 36, height: 36),
                    SizedBox(height: 16),
                    Text("Available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "PoppinsRegular",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        ))
                  ],
                ),

                SizedBox(width: 55),

                Column(
                  children: [
                    Image.asset("assets/img_booked_seat.png", width: 36, height: 36),
                    SizedBox(height: 16),
                    Text("Booked",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "PoppinsRegular",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        ))
                  ],
                ),

                SizedBox(width: 55),

                Column(
                  children: [
                    Image.asset("assets/img_selected_seat.png", width: 36, height: 36),
                    SizedBox(height: 16),
                    Text("Selected",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "PoppinsRegular",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        ))
                  ],
                )
              ],
            ),

            SizedBox(height: 16),

           GetBuilder<CarSeatsController>(
             id: "select_seat",
             init: CarSeatsController(),
             builder: (value) =>  Expanded(child: Container(
             width: double.maxFinite,
             height: double.maxFinite,
             child: Stack(
               children: [
                 Image.asset("assets/img_seat_background.png", width: double.maxFinite,
                     height: double.maxFinite, fit: BoxFit.fill),

                 Padding(padding: EdgeInsets.all(36), child:  GridView.count(
                   childAspectRatio: 1.65,
                   crossAxisCount: 4,
                   padding: EdgeInsets.zero,
                   children: List.generate(_carSeatsController.seatsList.length, (index) {
                     Map mapSeat = _carSeatsController.seatsList[index];
                     return GestureDetector(
                       child: Center(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Visibility(child: Text("${mapSeat["name"]}", style: TextStyle(
                               fontFamily: "PoppinsRegular",
                             )), visible: index % 2 == 0),
                             SizedBox(width: 4),
                             Image.asset(value.selectedSeat == index ? "assets/img_selected_seat.png" :
                             value.parseSeatImage(mapSeat["type"]), width: 36, height: 36),
                             SizedBox(width: 4),
                             Visibility(child: Text(mapSeat["name"], style: TextStyle(
                               fontFamily: "PoppinsRegular",
                             )), visible: index % 2 != 0),
                           ],
                         ),
                       ),
                       onTap: (){
                          if(mapSeat["type"] == 0 || mapSeat["type"] == 3){
                            value.selectSeat(index,0);
                          }
                       },
                     );
                   }),
                 ))
               ],
             ),
           ), flex: 1)),

            Container(
              width: double.maxFinite,
              height: 1,
              color: Color.fromRGBO(235, 235, 235, 1.0),
            ),

            SizedBox(height: 24),

            GetBuilder<CarSeatsController>(
              id: "seat_list",
              init: CarSeatsController(),
              builder: (value) => Row(
                children: [
                  SizedBox(width: 24),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Seat (s)", style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(135, 141, 156, 1.0),
                          fontFamily: "PoppinsRegular"
                      )),
                      SizedBox(height: 8),
                      Text(value.strSelectedSeat, style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(63, 61, 86, 1.0),
                          fontFamily: "PoppinsMedium"
                      ))
                    ],
                  ),

                  Expanded(child: SizedBox(), flex: 1),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total", style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(135, 141, 156, 1.0),
                        fontFamily: "PoppinsRegular",
                      )),
                      SizedBox(height: 8),
                      Text("RM${value.strPrice}", style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(22, 212, 98, 1.0),
                        fontFamily: "PoppinsBold",
                      ))
                    ],
                  ),

                  SizedBox(width: 24),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.all(24), child: GestureDetector(
              child: ColoredButton(height: 55, width: double.maxFinite, title: "Next",
                  color: Color.fromRGBO(255, 205, 56, 1.0)),
              onTap: (){
                Get.to(() => TicketDetailsSeatView());
              },
            ))
          ],
        ),
      ),
    );
  }
}
