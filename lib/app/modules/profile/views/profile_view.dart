import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                  Text("Profile", style: TextStyle(
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
                            child: ColoredButton(height: 55, width: double.maxFinite, title: "Edit Profile",
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
}
