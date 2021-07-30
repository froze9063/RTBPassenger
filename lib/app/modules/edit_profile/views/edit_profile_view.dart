import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_edittext.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> implements CustomEdittextCallback{

  EditProfileController _editProfileController = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                child: GestureDetector(
                  child: Container(
                    width: 55,
                    height: 55,
                    color: Colors.transparent,
                    child: Center(
                      child: Image.asset(
                          "assets/ic_new_back_yellow.png", width: 24,
                          height: 24),
                    ),
                  ),
                  onTap: (){
                    Get.back();
                  },
                ), top: 45, left: 1),

            Container(
              margin: EdgeInsets.only(top: 59),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Edit Profile", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(63, 61, 86, 1.0),
                      fontFamily: "PoppinsBold"
                  ), textAlign: TextAlign.center,)
                ],
              ),
            ),

            Column(
              children: [
                SizedBox(height: 135),
                Expanded(child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 36),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                  child: Container(
                                    width: double.maxFinite,
                                    padding: EdgeInsets.all(16),
                                    child: Text("elizabethtan@gmail.com", style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                        fontFamily: "PoppinsMedium"
                                    )),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: Color.fromRGBO(195, 194, 204, 0.5)
                                    ),
                                  ),
                                ),

                                GetBuilder<EditProfileController>(
                                  id: "border_color",
                                  init: EditProfileController(),
                                  builder: (value) => Column(
                                    children: [
                                      Padding(padding: EdgeInsets.only(top: 16),
                                          child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                          "Full Name", textEditingController: _editProfileController.fullnameEditingController,
                                              isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                              borderColor: value.fullnameBorderColor,type: "fullname",customEdittextCallback: this)),

                                      Padding(padding: EdgeInsets.only(top: 16),
                                          child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                          "Mobile No.", textEditingController: _editProfileController.phoneEditingController,
                                              isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                              borderColor: value.mobileBorderColor,type: "mobile",customEdittextCallback: this)),

                                      Padding(padding: EdgeInsets.only(top: 16),
                                          child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                          "Password", textEditingController: _editProfileController.passwordEditingController,
                                              isSecure: true, isPasswordField: true, backgroundColor: Colors.white,
                                              borderColor: value.passwordBorderColor,type: "password",customEdittextCallback: this)),

                                      Padding(padding: EdgeInsets.only(top: 16),
                                          child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                          "Confirm Password", textEditingController: _editProfileController.confirmPasswordEditingController,
                                              isSecure: true, isPasswordField: true, backgroundColor: Colors.white,
                                              borderColor: value.confirmPasswordBorderColor,type: "confirm",customEdittextCallback: this))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ), flex: 1),
                          GestureDetector(
                            child: ColoredButton(height: 55, width: double.maxFinite, title: "Update Profile",
                                color: Color.fromRGBO(255, 205, 56, 1.0)),
                            onTap: (){

                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 24),
                Text("Log Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "PoppinsBold",
                        color: Color.fromRGBO(255, 205, 56, 1.0)
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
                  Image.asset("assets/img_default_profile.png", height: 55, width: 55)
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
    _editProfileController.changeBorderColor(text, type);
  }
}
