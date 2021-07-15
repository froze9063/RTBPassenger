import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {

  double height = 0;
  double width = 0;
  String title = "";
  Color color;

  ColoredButton({required this.height, required this.width, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Text(
            title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
              fontFamily: "PoppinsBold"
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: color
      ),
    );
  }
}