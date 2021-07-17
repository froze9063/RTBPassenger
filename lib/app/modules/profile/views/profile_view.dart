import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      GestureDetector(
                        child: Image.asset("assets/ic_new_back_yellow.png", height: 18, width: 18),
                        onTap: (){
                          Get.back();
                        },
                      ),
                      Expanded(child: Text("Profile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "PoppinsBold",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          ))),
                      SizedBox(width: 24),
                    ],
                  ),
                  SizedBox(height: 45),
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
                                SizedBox(height: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text("Email", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(135, 141, 156, 1.0),
                                          fontFamily: "PoppinsRegular"
                                      )),
                                      SizedBox(height: 8),
                                      Text("elizabethtan@gmail.com", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                          fontFamily: "PoppinsMedium"
                                    )),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(135, 141, 156, 1.0),
                                        fontFamily: "PoppinsRegular"
                                    )),
                                    SizedBox(height: 8),
                                    Text("Elizabeth Tan Huey Ling", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                        fontFamily: "PoppinsMedium"
                                    )),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Mobile No.", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(135, 141, 156, 1.0),
                                        fontFamily: "PoppinsRegular"
                                    )),
                                    SizedBox(height: 8),
                                    Text("+65 4589 0321", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(63, 61, 86, 1.0),
                                        fontFamily: "PoppinsMedium"
                                    )),
                                  ],
                                ),
                                Expanded(child: SizedBox(), flex: 1),
                                GestureDetector(
                                  child: ColoredButton(height: 45, width: double.maxFinite, title: "Edit Profile",
                                      color: Color.fromRGBO(255, 205, 56, 1.0)),
                                  onTap: (){
                                    Get.to(EditProfileView());
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
                margin: EdgeInsets.only(top: 65),
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
      ),
    );
  }
}
