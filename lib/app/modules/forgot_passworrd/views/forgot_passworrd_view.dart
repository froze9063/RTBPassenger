import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';
import 'package:ridethebee/app/callback/password_callback.dart';
import 'package:ridethebee/app/modules/create_password/views/create_password_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_edittext.dart';

import '../controllers/forgot_passworrd_controller.dart';

class ForgotPassworrdView extends GetView<ForgotPassworrdController> implements CustomEdittextCallback,
    PasswordCallback{

  ForgotPassworrdController forgotPasswordController = Get.put(
      ForgotPassworrdController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromRGBO(255, 166, 0, 1.0),
                        Color.fromRGBO(255, 205, 56, 1.0)
                      ]
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/img_ride_the_bee.png", fit: BoxFit.fitHeight)
                ],
              ),
            ),

            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 75),

                  Image.asset("assets/img_splash_logo.png", height: 149,
                      width: 179),

                  SizedBox(height: 16),

                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    width: double.maxFinite,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16,top: 24,bottom: 24),
                        child: GetBuilder<ForgotPassworrdController>(
                          id: "border_color",
                          init: ForgotPassworrdController(),
                          builder: (value) => Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Forgot Password?", style: TextStyle(
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                        fontSize: 16,
                                        fontFamily: "PoppinsBold"))
                                  ],
                                ),
                              ),

                              SizedBox(height: 16),

                              CustomEditText(height: 55, width: double.maxFinite, placeholder:
                              "Email Address", textEditingController: value.emailEditing,
                                isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                borderColor: value.emailBorderColor,type: "email",customEdittextCallback: this,
                                passwordCallback: this,
                              ),

                              SizedBox(height: 16),

                              GestureDetector(
                                child: ColoredButton(height: 55, width: double.maxFinite, title: "Submit",
                                    color: Color.fromRGBO(255, 205, 56, 1.0)),
                                onTap: (){
                                    Get.to(() => CreatePasswordView());
                                },
                              )
                            ],
                          ),
                        )
                        ,
                      ),
                    ),
                  ),

                  Expanded(child: SizedBox(), flex: 1),

                  Padding(padding: EdgeInsets.only(left: 24,right: 24,bottom: 36), child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Back to", style: TextStyle(
                            color: Color.fromRGBO(195, 194, 204, 1.0),
                            fontFamily: "PoppinsRegular"
                        )),

                        SizedBox(width: 4),

                        Text("Login", style: TextStyle(
                            color: Color.fromRGBO(255, 205, 56, 1.0),
                            fontFamily: "PoppinsMedium"
                        )),
                      ],
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  onChanged(String text, String type) {
    forgotPasswordController.changeBorderColor(text, type);
  }

  @override
  void onPasswordClicked(String type) {

  }
}
