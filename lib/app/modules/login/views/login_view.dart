import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';
import 'package:ridethebee/app/callback/login_callback.dart';
import 'package:ridethebee/app/callback/password_callback.dart';
import 'package:ridethebee/app/modules/forgot_passworrd/views/forgot_passworrd_view.dart';
import 'package:ridethebee/app/modules/home/views/home_view.dart';
import 'package:ridethebee/app/modules/register/views/register_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_edittext.dart';
import 'package:ridethebee/app/widgets/custom_loading.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> implements CustomEdittextCallback,
    LoginCallback, PasswordCallback{

  LoginController loginController = Get.put(LoginController());
  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
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

            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 75),

                  Image.asset("assets/img_splash_logo.png", height: 149,
                      width: 179),

                  SizedBox(height: 16),

                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      elevation: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 36,right: 16, top: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sign In", style: TextStyle(
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    fontSize: 16,
                                    fontFamily: "PoppinsBold"))
                              ],
                            ),
                          ),

                          /*Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 16), child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("OTP", style: TextStyle(
                                color: Color.fromRGBO(195, 194, 204, 1.0),
                                fontWeight: FontWeight.w500)),

                            SizedBox(width: 8),

                            FlutterSwitch(
                              width: 42.0,
                              height: 20.0,
                              valueFontSize: 12.0,
                              toggleSize: 18.0,
                              inactiveColor: Colors.white,
                              activeColor:  Colors.white,
                              toggleColor: Color.fromRGBO(255, 205, 56, 1.0),
                              switchBorder: Border.all(
                                  color: Color.fromRGBO(220, 220, 220, 1.0)
                              ),
                              value: false,
                              onToggle: (val) {

                              },
                            )
                          ],
                        )
                        ),*/

                          GetBuilder<LoginController>(
                            id: "border_color",
                            init: LoginController(),
                            builder: (value) => Column(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 24,right: 24, top: 24),
                                    child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                    "Email", textEditingController: loginController.emailController,
                                        isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                        borderColor: value.emailBorderColor,type: "email",customEdittextCallback: this,
                                        passwordCallback: this,
                                    )),

                                Padding(padding: EdgeInsets.only(left: 24,right: 24, top: 16),
                                    child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                    "Password", textEditingController: loginController.passwordController,
                                        isSecure: value.isPasswordSecured, isPasswordField: true, backgroundColor: Colors.white,
                                        borderColor: value.passwordBorderColor,type: "password"
                                        ,customEdittextCallback: this, passwordCallback: this)),
                              ],
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(left: 24, right: 24,top: 16),
                              child: Row(
                                children: [
                                  GetBuilder<LoginController>(
                                    id: "remember_me",
                                    init: LoginController(),
                                    builder: (value) => GestureDetector(
                                      child: Container(
                                        child: Checkbox(
                                            value: value.isRememberMe,
                                            activeColor: Colors.white,
                                            side: BorderSide(color: Colors.white),
                                            checkColor: Color.fromRGBO(255, 205, 56, 1.0),
                                            onChanged: (values){
                                              value.setRememberMe();
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
                                      onTap: (){
                                          value.setRememberMe();
                                      },
                                    ),
                                  ),

                                  SizedBox(width: 8),

                                  Text("Remember me", style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(220, 220, 220, 1.0),
                                      fontFamily: "PoppinsRegular")),

                                  Expanded(child: SizedBox(), flex: 1),

                                  GestureDetector(
                                    child: Text("Forgot Password?", style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(255, 205, 56, 1.0),
                                        fontFamily: "PoppinsMedium")),
                                    onTap: (){
                                      Get.to(() => ForgotPassworrdView());
                                    },
                                  )
                                ],
                              )),

                          Padding(padding: EdgeInsets.only(top: 36, left: 28, right: 28), child: GestureDetector(
                            child: ColoredButton(height: 55, width: double.maxFinite, title: "Sign In",
                                color: Color.fromRGBO(255, 205, 56, 1.0)),
                            onTap: (){
                              loginController.login(this);
                              //Get.to(HomeView());
                            },
                          )),

                        /*  Padding(padding: EdgeInsets.only(top: 16, left: 24, right: 24),
                            child: Text("Or sign in with", style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(135, 141, 156, 1.0),
                                fontFamily: "PoppinsRegular"
                            )),
                          ),

                          Padding(padding: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 24), child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/ic_facebook.png",width: 30,height: 30),

                              SizedBox(width: 55),

                              Image.asset("assets/ic_google_plus.png",width: 30,height: 30),
                            ],
                          ))*/

                          SizedBox(height: 36)
                        ],
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(left: 24,right: 24,bottom: 36, top: 36), child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(
                            color: Color.fromRGBO(195, 194, 204, 1.0),
                            fontFamily: "PoppinsRegular"
                        )),

                        SizedBox(width: 4),

                        Text("Sign Up", style: TextStyle(
                            color: Color.fromRGBO(255, 205, 56, 1.0),
                            fontFamily: "PoppinsMedium"
                        )),
                      ],
                    ),
                    onTap: (){
                      Get.to(RegisterView());
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
    loginController.changeBorderColor(text, type);
  }

  @override
  void onLoginLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onLoginSuccess(String message, String status) {
    Get.back();
    CustomToast.showToast(message);
    Get.offAll(() => HomeView());
  }

  @override
  void onLoginFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }

  @override
  void onPasswordClicked(String type) {
    loginController.setPasswordSecured(type);
  }
}

