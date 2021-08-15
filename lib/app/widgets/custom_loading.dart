import 'package:flutter/material.dart';

class CustomLoading {
  static showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
            Container(
                margin: EdgeInsets.only(left: 24.0), child: Text("Loading...")),
          ]),
    );

    showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}