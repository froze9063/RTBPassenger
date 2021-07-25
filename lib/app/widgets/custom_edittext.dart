import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridethebee/app/callback/custom_edittext_callback.dart';

class CustomEditText extends StatelessWidget {

  double height = 0;
  double width = 0;
  String placeholder = "";
  TextEditingController textEditingController;
  bool isSecure = false;
  bool isPasswordField = false;
  Color backgroundColor = Colors.white;
  Color borderColor = Colors.white;
  String type = "";
  CustomEdittextCallback customEdittextCallback;

  CustomEditText({required this.height, required this.width, required this.placeholder,
    required this.textEditingController, required this.isSecure, required this.isPasswordField,required
    this.backgroundColor, required this.borderColor, required this.type, required this.customEdittextCallback});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: backgroundColor,
      child: Container(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Row(
              children: [
                SizedBox(width: 16),

                Expanded(child: TextField(
                  controller: textEditingController,
                  decoration: new InputDecoration.collapsed(
                      hintText: placeholder,
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(135, 141, 156, 1.0),
                          fontFamily: "PoppinsRegular",
                          fontSize: 15
                      )
                  ),
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 15,
                    color: Color.fromRGBO(63, 61, 86, 1.0),
                  ),
                  onChanged: (value){
                    customEdittextCallback.onChanged(value, type);
                  },
                ), flex: 1),

                Visibility(child: Image.asset("assets/ic_eye_open.png",
                    height: 24, width: 24), visible: isPasswordField),

                SizedBox(width: 16)
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: borderColor
            )
        ),
      ),
    );
  }
}