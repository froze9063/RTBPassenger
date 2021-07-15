import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridethebee/app/modules/my_tickets/controllers/my_tickets_controller.dart';

class UpcomingView extends StatelessWidget{

  MyTicketsController _tripsController;
  UpcomingView(this._tripsController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 24),child: Row(
            children: [
              Text("Filter by:", style: TextStyle(
                  color: Color.fromRGBO(135, 141, 156, 1.0),
                  fontFamily: "PoppinsRegular"
              )),
              SizedBox(width: 8),
              Text("This Week", style: TextStyle(
                  color: Color.fromRGBO(63, 61, 86, 1.0),
                  fontFamily: "PoppinsMedium"
              )),
              SizedBox(width: 8),
              Image.asset("assets/ic_yellow_dropdown.png", height: 16, width: 16)
            ],
          )),

          SizedBox(height: 24),

          Expanded(child: ListView.builder(itemBuilder: (context, index){
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: index == 0 ? 0 : 24,left: 24, right: 24),
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24, right: 24, top: 16,bottom: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        width: 0.5,
                        color: Color.fromRGBO(63, 61, 86, 0.5)
                    )
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/img_ridethebees.png",height: 55, width: 55),
                        SizedBox(width: 16),
                        Container(
                          padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/ic_bus.png", width: 12, height: 12, fit: BoxFit.cover),
                              SizedBox(width: 4),
                              Text("SAB 4124",
                                  style: TextStyle(
                                      color: Color.fromRGBO(35, 35, 35, 1.0),
                                      fontSize: 14,
                                      fontFamily: "PoppinsMedium"
                                  ))
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 205, 56, 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                        ),
                        Expanded(child: SizedBox(), flex: 1),
                        Text("18-06-2021",
                            style: TextStyle(
                                color: Color.fromRGBO(22, 212, 98, 1.0),
                                fontSize: 18,
                                fontFamily: "PoppinsBold"
                            ))
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        Container(
                          child: Text("From", style: TextStyle(
                              fontSize: 14,
                              fontFamily: "PoppinsMedium",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          )),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                              )
                          ),
                          padding: EdgeInsets.only(left: 12, right: 12, top: 4,bottom: 4),
                        ),

                        Expanded(child: Image.asset("assets/ic_track.png"), flex: 1),

                        Container(
                          child: Text("To", style: TextStyle(
                              fontSize: 14,
                              fontFamily: "PoppinsMedium",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          )),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                              )
                          ),
                          padding: EdgeInsets.only(left: 12, right: 12, top: 4,bottom: 4),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                            Text("Sungai Nibong Bus Terminal", style: TextStyle(
                                fontSize: 14,
                                fontFamily: "PoppinsMedium",
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                height: 1.5
                            )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ), flex: 2),

                        Expanded(child: SizedBox(), flex: 1),

                        Expanded(child: Column(
                          children: [
                            Text("Sungai Nibong Bus Terminal",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "PoppinsMedium",
                                    color: Color.fromRGBO(63, 61, 86, 1.0),
                                    height: 1.5
                                )),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ), flex: 2),
                      ],
                    ),

                    SizedBox(height: 24),

                    Row(
                      children: [
                        Text("10:15 AM", style: TextStyle(
                            fontSize: 18,
                            fontFamily: "PoppinsMedium",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        )),

                        Expanded(child: SizedBox(), flex: 1),

                        Text("1:05 PM", style: TextStyle(
                            fontSize: 18,
                            fontFamily: "PoppinsMedium",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        )),
                      ],
                    ),

                    SizedBox(height: 16),
                  ],
                ),
              ),
              onTap: (){

              },
            );
          },
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 6,
            primary: false,
          ), flex: 1)
        ],
      ),
    );
  }
}