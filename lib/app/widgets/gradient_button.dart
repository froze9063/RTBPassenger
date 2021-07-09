import 'package:flutter/cupertino.dart';

class GradientButton extends StatelessWidget {

   double height = 0;
   double width = 0;
   String title = "";

   GradientButton({required this.height, required this.width, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Text(
          title
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromRGBO(255, 205, 56, 1.0),
                Color.fromRGBO(255, 166, 0, 1.0)
              ]
          )
      ),
    );
  }
}