import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {

  double height = 0;
  double width = 0;
  String placeholder = "";
  TextEditingController textEditingController;
  bool isSecure = false;
  bool isPasswordField = false;
  Color backgroundColor = Colors.white;

  CustomEditText({required this.height, required this.width, required this.placeholder,
    required this.textEditingController, required this.isSecure, required this.isPasswordField,required
    this.backgroundColor});

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
                Expanded(child: TextField(
                    controller: textEditingController,
                    decoration: new InputDecoration.collapsed(
                        hintText: placeholder
                    )
                ), flex: 1),

                Visibility(child: Image.asset("assets/ic_eye_open.png",
                    height: 24, width: 24), visible: isPasswordField)
              ],
            ),
          ),
        ),
      ),
    );
  }
}