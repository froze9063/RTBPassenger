import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/rate_callback.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/thank_you/views/thank_you_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_loading.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';

import '../controllers/review_controller.dart';

class ReviewView extends GetView<ReviewController> implements RateCallback{

  late BuildContext _buildContext;
  ReviewController _reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 305,
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
                                    ),
                                    onTap: (){

                                    },
                                  ),
                                  Expanded(child: Text(
                                      "Trip Completed",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(63, 61, 86, 1.0),
                                          fontFamily: "PoppinsBold"
                                      )), flex: 1),
                                  GestureDetector(
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      color: Colors.transparent,
                                      child: Center(
                                        child: Image.asset("assets/ic_close_black.png",height: 24, width: 20),
                                      ),
                                    ),
                                    onTap: (){
                                      Get.offAll(() => HomeView());
                                    },
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),

                              Image.asset("assets/img_driver_home.png", width: 100, height: 100),

                              SizedBox(height: 16),

                              Text("John Travis Scott Travolta", style: TextStyle(
                                  color: Color.fromRGBO(35, 35, 35, 1.0), fontSize: 20,
                                  fontFamily: "PoppinsBold"
                              )),

                              SizedBox(height: 8),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/ic_black_star.png"),
                                  SizedBox(width: 8),
                                  Text("4.8 Driver Rating", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 15,
                                      fontFamily: "PoppinsMedium"
                                  ))
                                ],
                              ),
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
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(234, 237, 241, 1.0)
                    )
                ),
              ),

              SizedBox(height: 36),

              Row(
                children: [
                  SizedBox(width: 48),
                  Text("Driver Rating", style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(135, 141, 156, 1.0),
                      fontFamily: "PoppinsRegular"
                  ))
                ],
              ),

              SizedBox(height: 16),

              GetBuilder<ReviewController>(
                  id: "star",
                  init: ReviewController(),
                  builder: (value) => Row(
                    children: [
                      SizedBox(width: 48),
                      Expanded(child: GestureDetector(
                        child: Image.asset(value.starCount < 1 ? "assets/ic_white_star.png" : "assets/ic_yellow_star.png",
                            width: 36, height: 36),
                        onTap: (){
                          value.setStar(1);
                        },
                      )),
                      Expanded(child: GestureDetector(
                        child: Image.asset(value.starCount < 2 ? "assets/ic_white_star.png" : "assets/ic_yellow_star.png",
                            width: 36, height: 36),
                        onTap: (){
                          value.setStar(2);
                        },
                      )),
                      Expanded(child: GestureDetector(
                        child: Image.asset(value.starCount < 3 ? "assets/ic_white_star.png" : "assets/ic_yellow_star.png",
                            width: 36, height: 36),
                        onTap: (){
                          value.setStar(3);
                        },
                      )),
                      Expanded(child: GestureDetector(
                        child: Image.asset(value.starCount < 4 ? "assets/ic_white_star.png" : "assets/ic_yellow_star.png",
                            width: 36, height: 36),
                        onTap: (){
                          value.setStar(4);
                        },
                      )),
                      Expanded(child: GestureDetector(
                        child: Image.asset(value.starCount < 5 ? "assets/ic_white_star.png" : "assets/ic_yellow_star.png",
                            width: 36, height: 36),
                        onTap: (){
                          value.setStar(5);
                        },
                      )),
                      SizedBox(width: 48)
                    ],
                  )),

              SizedBox(height: 36),

              Row(
                children: [
                  SizedBox(width: 48),
                  Text("Feedback", style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(135, 141, 156, 1.0),
                      fontFamily: "PoppinsRegular"
                  ))
                ],
              ),

              Container(
                margin: EdgeInsets.only(left: 36,right: 36,bottom: 36,top: 16),
                width: double.maxFinite,
                height: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      controller: _reviewController.rateEditingController,
                      decoration: InputDecoration.collapsed(
                        hintText: "Input Feedback",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(135, 141, 156, 1.0),
                            height: 1.5,
                            fontFamily: "PoppinsRegular"
                        ),
                      ),
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(63, 61, 86, 1.0),
                          height: 1.5,
                          fontFamily: "PoppinsRegular"
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 36),

              Padding(padding: EdgeInsets.only(bottom: 24, left: 24, right: 24), child: GestureDetector(
                child: ColoredButton(height: 55, width: double.maxFinite, title: "Submit",
                    color: Color.fromRGBO(255, 205, 56, 1.0)),
                onTap: (){
                   _reviewController.review(this);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onRateLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onRateSuccess(String message, String status) {
    if(status == "success"){
      Get.back();
      Get.back();
      CustomToast.showToast(message);
      Get.to(() => ThankYouView());
    }
    else {
      Get.back();
      CustomToast.showToast(message);
    }
    print(message);
  }

  @override
  void onRateFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }
}
