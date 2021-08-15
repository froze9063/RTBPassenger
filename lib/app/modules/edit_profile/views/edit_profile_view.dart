import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';
import 'package:ridethebee/app/callback/delete_image_callback.dart';
import 'package:ridethebee/app/callback/edit_profile_callback.dart';
import 'package:ridethebee/app/callback/password_callback.dart';
import 'package:ridethebee/app/callback/upload_photo_callback.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_edittext.dart';
import 'package:ridethebee/app/widgets/custom_loading.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> implements CustomEdittextCallback,
    PasswordCallback, EditProfileCallback, RemoveImageCallback, UploadPhotoCallback{

  EditProfileController _editProfileController = Get.put(EditProfileController());
  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: GetBuilder<EditProfileController>(
          id: "profile",
          init: EditProfileController(),
          builder: (profile_value) => Stack(
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
                                      child: Text(profile_value.email, style: TextStyle(
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
                                              borderColor: value.fullnameBorderColor,type: "fullname",customEdittextCallback: this,
                                              passwordCallback: this,
                                            )),

                                        Padding(padding: EdgeInsets.only(top: 16),
                                            child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                            "Mobile No.", textEditingController: _editProfileController.phoneEditingController,
                                              isSecure: false, isPasswordField: false, backgroundColor: Colors.white,
                                              borderColor: value.mobileBorderColor,type: "mobile",customEdittextCallback: this,
                                              passwordCallback: this,)),

                                        Padding(padding: EdgeInsets.only(top: 16),
                                            child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                            "Password", textEditingController: _editProfileController.passwordEditingController,
                                              isSecure: true, isPasswordField: true, backgroundColor: Colors.white,
                                              borderColor: value.passwordBorderColor,type: "password",customEdittextCallback: this,
                                              passwordCallback: this,
                                            )),

                                        Padding(padding: EdgeInsets.only(top: 16),
                                            child: CustomEditText(height: 55, width: double.maxFinite, placeholder:
                                            "Confirm Password", textEditingController: _editProfileController.confirmPasswordEditingController,
                                              isSecure: true, isPasswordField: true, backgroundColor: Colors.white,
                                              borderColor: value.confirmPasswordBorderColor,type: "confirm",customEdittextCallback: this,
                                              passwordCallback: this,
                                            ))
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 24)
                                ],
                              ),
                            ), flex: 1),
                            GestureDetector(
                              child: ColoredButton(height: 55, width: double.maxFinite, title: "Update Profile",
                                  color: Color.fromRGBO(255, 205, 56, 1.0)),
                              onTap: (){
                                  _editProfileController.editProfile(this);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ),

                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
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
                    ),
                    onTap: (){
                      _editProfileController.logout();
                    },
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 115),
                width: double.maxFinite,
                child: GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        profile_value.urlImage.isNotEmpty ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 28.0,
                          backgroundImage: NetworkImage("https://ridethebee-staging.vecapital.asia/storage/app/passengers/${profile_value.urlImage}"),
                        ) : Image.asset("assets/img_default_profile.png", height: 55, width: 55)
                      ],
                    ),
                  ),
                  onTap: (){
                    _showMyDialog();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: _buildContext,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: GetBuilder<EditProfileController>(
            id: "profile",
            init: EditProfileController(),
            builder: (value) => Container(
              color: Colors.white,
              height: value.urlImage.isNotEmpty ? 180 : 135,
              child: Column(
                children: [
                  Expanded(child: GestureDetector(
                    child: Container(
                      color: Colors.white,
                      width: double.maxFinite,
                      child: Center(
                        child: Row(
                          children: [
                            Text("Photo", style: TextStyle(
                                fontFamily: "PoppinsMedium",
                                color: Color.fromRGBO(58, 58, 58, 1.0)
                            ))
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      _editProfileController.getImage(0, this);
                    },
                  ), flex: 1),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Expanded(child: GestureDetector(
                    child: Container(
                      color: Colors.white,
                      width: double.maxFinite,
                      child: Center(
                        child: Row(
                          children: [
                            Text("Gallery", style: TextStyle(
                                fontFamily: "PoppinsMedium",
                                color: Color.fromRGBO(58, 58, 58, 1.0)
                            ))
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      _editProfileController.getImage(1, this);
                    },
                  ), flex: 1),

                  Visibility(child: Container(
                    width: double.maxFinite,
                    height: 1,
                    color: Colors.grey,
                  ), visible: value.urlImage.isNotEmpty),

                 Visibility(child: Expanded(child: GestureDetector(
                   child: Container(
                     color: Colors.white,
                     width: double.maxFinite,
                     child: Center(
                       child: Row(
                         children: [
                           Text("Remove Photo", style: TextStyle(
                               fontFamily: "PoppinsMedium",
                               color: Colors.red
                           ))
                         ],
                       ),
                     ),
                   ),
                   onTap: (){
                      value.removePhoto(this);
                   },
                 ), flex: 1), visible: value.urlImage.isNotEmpty)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  onChanged(String text, String type) {
    _editProfileController.changeBorderColor(text, type);
  }

  @override
  void onPasswordClicked(String type) {

  }

  @override
  void onEditProfileLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onEditProfileSuccess(String message, String status) {
    if(status == "success"){
      Get.back();
      CustomToast.showToast(message);
    }
    else {
      Get.back();
      CustomToast.showToast(message);
    }
  }

  @override
  void onEditProfileFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }

  @override
  void onRemoveImageLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onRemoveImageSuccess(String message, String status) {
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
  void onRemoveImageFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }

  @override
  void onUploadPhotoLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onUploadPhotoSuccess(String message, String status) {
    if(status == "success"){
      Get.back();
      CustomToast.showToast(message);
    }
    else {
      Get.back();
      CustomToast.showToast(message);
    }
  }

  @override
  void onUploadPhotoFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }
}
