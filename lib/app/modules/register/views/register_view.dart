import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';
import 'package:ridethebee/app/callback/password_callback.dart';
import 'package:ridethebee/app/callback/register_callback.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_edittext.dart';
import 'package:ridethebee/app/widgets/custom_loading.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> implements CustomEdittextCallback,
    RegisterCallback, PasswordCallback{

  RegisterController registerController = Get.put(RegisterController());
  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      backgroundColor: Colors.white,
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
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Column(
                  children: [
                    SizedBox(height: 75),

                    Image.asset("assets/img_splash_logo.png", height: 149,
                        width: 179),

                    SizedBox(height: 16),

                    Expanded(child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      elevation: 1,
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 8), child: Text("Create an account", style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(63, 61, 86, 1.0),
                                  fontFamily: "PoppinsBold"
                              ))),

                              GetBuilder<RegisterController>(
                                id: "border_color",
                                init: RegisterController(),
                                builder: (value) => Column(
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 16),
                                        child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                        "Your Email", textEditingController: registerController.emailController,
                                            isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                            borderColor: value.emailBorderColor,type: "email",customEdittextCallback: this,
                                            passwordCallback: this,
                                        )),

                                    Padding(padding: EdgeInsets.only(top: 16),
                                        child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                        "Full Name", textEditingController: registerController.fullnameController,
                                            isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                            borderColor: value.fullnameBorderColor,type: "fullname",customEdittextCallback: this,
                                            passwordCallback: this,
                                        )),

                                    Padding(padding: EdgeInsets.only(top: 16),
                                        child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                        "Mobile No.", textEditingController: registerController.mobileController,
                                            isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                            borderColor: value.mobileBorderColor,type: "mobile",customEdittextCallback: this,
                                            passwordCallback: this,
                                        )),


                                    Padding(padding: EdgeInsets.only(top: 10), child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 16),
                                          Expanded(child: TextField(
                                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                                            decoration: InputDecoration.collapsed(
                                                hintText: "Referral Code",
                                                hintStyle: TextStyle(
                                                    color: Color.fromRGBO(135, 141, 156, 1.0),
                                                    fontFamily: "PoppinsRegular",
                                                    fontSize: 15
                                                )
                                            ),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "PoppinsMedium",
                                                color: Color.fromRGBO(63, 61, 86, 1.0)
                                            ),
                                          )),

                                          GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(255, 205, 56, 1.0),
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8),
                                                      bottomRight: Radius.circular(8))
                                              ),
                                              child: Text("Apply", style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: "PoppinsBold"
                                              )),
                                            ),
                                            onTap: (){

                                            },
                                          )
                                        ],
                                      ),
                                    )),

                                    Padding(padding: EdgeInsets.only(top: 16),
                                        child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                        "Password", textEditingController: registerController.passwordController,
                                            isSecure: value.isPasswordSecured, isPasswordField: true, backgroundColor: Colors.white,
                                            borderColor: value.passwordBorderColor,type: "password",customEdittextCallback: this,
                                            passwordCallback: this,
                                        )),

                                    Padding(padding: EdgeInsets.only(top: 16),
                                        child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                        "Confirm Password", textEditingController: registerController.confirmPasswordController,
                                            isSecure: value.isPasswordConfirmSecured, isPasswordField: true, backgroundColor: Colors.white,
                                            borderColor: value.confirmPasswordBorderColor,type: "confirm",customEdittextCallback: this, passwordCallback: this,)),
                                  ],
                                ),
                              ),

                              SizedBox(height: 36),

                              Row(
                                children: [
                                  Container(
                                    child: Checkbox(
                                        value: true,
                                        activeColor: Colors.white,
                                        checkColor: Color.fromRGBO(255, 205, 56, 1.0),
                                        onChanged: (value){

                                        }),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromRGBO(220, 220, 220, 1.0),
                                            width: 1
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(8))
                                    ),
                                    height: 24,
                                    width: 24,
                                  ),

                                  SizedBox(width: 8),

                                  Text("I have agreed with", style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(112, 112, 112, 1.0),
                                      fontFamily: "PoppinsRegular")),

                                  SizedBox(width: 4),

                                  Text("Terms & Conditions.", style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(255, 205, 56, 1.0),
                                      fontFamily: "PoppinsMedium"))
                                ],
                              ),

                              SizedBox(height: 16),

                              Padding(padding: EdgeInsets.only(bottom: 0), child: GestureDetector(
                                child: ColoredButton(height: 45, width: double.maxFinite, title: "Sign Up",
                                    color: Color.fromRGBO(255, 205, 56, 1.0)),
                                onTap: (){
                                    registerController.register(this);
                                },
                              )),
                            ],
                          ),
                        ),
                      ),
                    ), flex: 1)
                  ],
                ),
            ),

            Positioned(child: GestureDetector(
              child: Image.asset("assets/ic_back_black.png", width: 24,
                  height: 24),
              onTap: (){
                Get.back();
              },
            ), left: 24, top: 45),
          ],
        ),
      ),
    );
  }

  @override
  onChanged(String text, String type) {
    registerController.changeBorderColor(text, type);
  }

  @override
  void onRegisterLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onRegisterSuccess(String message, String status) {
    if(status == "success"){
      Get.back();
      Get.back();
      CustomToast.showToast(message);
    }
    else {
      Get.back();
      CustomToast.showToast(message);
    }
  }

  @override
  void onRegisterFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }

  @override
  void onPasswordClicked(String type) {
     registerController.setPasswordToogle(type);
  }
}
