import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';

import '../controllers/thank_you_controller.dart';

class ThankYouView extends GetView<ThankYouController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
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
                ),
                onTap: (){

                },
              ),
              Expanded(child: Text(
                  "",
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
            SizedBox(height: 150),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/img_thankyou.png"),
                SizedBox(height: 16),
                Text("Thank You!", style: TextStyle(
                    color: Color.fromRGBO(255, 205, 56, 1.0),
                    fontSize: 20,
                    fontFamily: "PoppinsBold"
                )),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 24),
                    Expanded(child: Text("Thank you for sharing your thoughts. We appreciate your feedback!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(135, 141, 156, 1.0),
                            height: 1.5,
                            fontSize: 16,
                            fontFamily: "PoppinsRegular"
                        )), flex: 1),
                    SizedBox(width: 24)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );;
  }
}
