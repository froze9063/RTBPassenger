import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/login/views/login_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/boarding_controller.dart';

class BoardingView extends GetView<BoardingController> {
  BoardingController boardingController = Get.put(BoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 36,right: 36),
        child: Column(
          children: [
            SizedBox(height: 135),
            Container(
              width: double.maxFinite,
              height: 435,
              child: PageView(
                controller: boardingController.pageController,
                onPageChanged: (index){

                },
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img_boarding.png",
                        height: 222,
                        width: double.maxFinite,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 55),
                      ),

                      Text(
                        "Popular Coach Companies",
                        style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 24.0),
                      ),

                      Text(
                        "Be spoilt for choice. Book your bus tickets from a wide "
                            "list of coach companies.",
                        style: TextStyle(
                            color: Color.fromRGBO(144, 144, 144, 1.0),
                            fontSize: 16.0,
                            height: 1.5,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img_boarding_1.png",
                        height: 222,
                        width: double.maxFinite,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 55),
                      ),

                      Text(
                        "Map Tracking",
                        style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 24.0),
                      ),

                      Text(
                        "Track your trip progress on a map in real time and be "
                            "notified on multiple pit stops nearby.",
                        style: TextStyle(
                            color: Color.fromRGBO(144, 144, 144, 1.0),
                            fontSize: 16.0,
                            height: 1.5,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img_baording_2.png",
                        height: 222,
                        width: double.maxFinite,
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 55),
                      ),

                      Text(
                        "Cashback & Offers",
                        style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 24.0),
                      ),

                      Text(
                        "Get access to amazing deals and discounts with us.",
                        style: TextStyle(
                            color: Color.fromRGBO(144, 144, 144, 1.0),
                            fontSize: 16.0,
                            height: 1.5,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SmoothPageIndicator(
              controller: boardingController.pageController,  // PageController
              count: 3,
              effect: WormEffect(
                  dotWidth:  8.0,
                  dotHeight:  8.0,
                  spacing: 16,
                  activeDotColor:  Color.fromRGBO(255, 205, 56, 1.0),
                  dotColor: Color.fromRGBO(230, 230, 230, 1.0)
              ),  // your preferred effect
            ),

            Expanded(child: SizedBox(), flex: 1),

            GestureDetector(
              child: ColoredButton(height: 55, width: double.maxFinite, title: "Next",
                  color: Color.fromRGBO(255, 205, 56, 1.0)),
              onTap: (){
                Get.to(LoginView());
              },
            ),

            SizedBox(height: 100)
          ],
        ),
      ),
    );;
  }
}
