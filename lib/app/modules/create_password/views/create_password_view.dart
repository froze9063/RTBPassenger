import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';
import 'package:ridethebee/app/callback/password_callback.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_edittext.dart';

import '../controllers/create_password_controller.dart';

class CreatePasswordView extends GetView<CreatePasswordController> implements CustomEdittextCallback,
    PasswordCallback{

  CreatePasswordController createPasswordController = Get.put(CreatePasswordController());

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
                        padding: EdgeInsets.only(left: 16, right: 16,bottom: 24),
                        child: GetBuilder<CreatePasswordController>(
                          id: "border_color",
                          init: CreatePasswordController(),
                          builder: (value) => Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 24, left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Create New Password.", style: TextStyle(
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                        fontSize: 16,
                                        fontFamily: "PoppinsBold"))
                                  ],
                                ),
                              ),

                              SizedBox(height: 16),

                              CustomEditText(height: 55, width: double.maxFinite, placeholder:
                              "Password", textEditingController: createPasswordController.passwordController,
                                isSecure: value.isPasswordSecured, isPasswordField: true, backgroundColor: Colors.white,
                                borderColor: value.passwordBorderColor,type: "password",customEdittextCallback: this,
                                passwordCallback: this,
                              ),

                              SizedBox(height: 16),

                              CustomEditText(height: 55, width: double.maxFinite, placeholder:
                              "Confirm Password", textEditingController: createPasswordController.confirmPasswordController,
                                  isSecure: value.isPasswordConfirmSecured, isPasswordField: true, backgroundColor: Colors.white,
                                  borderColor: value.confirmPasswordBorderColor,type: "confirm",customEdittextCallback: this, passwordCallback: this),

                              SizedBox(height: 16),

                              GestureDetector(
                                child: ColoredButton(height: 55, width: double.maxFinite, title: "Submit",
                                    color: Color.fromRGBO(255, 205, 56, 1.0)),
                                onTap: (){

                                },
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),

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
    createPasswordController.changeBorderColor(text, type);
  }

  @override
  void onPasswordClicked(String type) {
    createPasswordController.setPasswordToogle(type);
  }
}
