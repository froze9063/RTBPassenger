import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/modules/my_tickets/controllers/my_tickets_controller.dart';
import 'package:shimmer/shimmer.dart';

class CompletedView extends StatelessWidget {

  MyTicketsController _tripsController;
  CompletedView(this._tripsController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<MyTicketsController>(
        id: "completed_ticket",
        init: MyTicketsController(),
        builder: (ticket_value) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
              width: double.maxFinite,
              height: 55,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                elevation: 2,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(child: TextField(
                          style: TextStyle(
                            color: Color.fromRGBO(63, 61, 86, 1.0),
                            fontFamily: "PoppinsMedium",
                          ),
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  color: Color.fromRGBO(135, 141, 156, 1.0)
                              )
                          ),
                        ), flex: 1),
                        SizedBox(width: 16),
                        Image.asset("assets/ic_search_white.png"),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(left: 24),
                child: Text("Showing 0 out of 0",
                    style: TextStyle(
                        color: Color.fromRGBO(35, 35, 35, 1.0),
                        fontSize: 14,
                        fontFamily: "PoppinsMedium"
                    ))
            ),

            SizedBox(height: 24),

            Container(
              width: double.maxFinite,
              height: 1,
              color: Color.fromRGBO(234, 237, 241, 1.0),
            ),

            Expanded(child: ticket_value.isCompletedLoading ? loadingView() : ticket_value.completedTripModelList.length > 0 ? ListView.builder(itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.only(top: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 24),
                        Image.asset("assets/img_ridethebees.png",height: 55,width: 55, fit: BoxFit.cover),
                        SizedBox(width: 16),
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  padding: EdgeInsets.only(top: 4, bottom: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/ic_bus.png", width: 10, height: 10, fit: BoxFit.cover),
                                      SizedBox(width: 4),
                                      Text("SAB 4124",
                                          style: TextStyle(
                                              color: Color.fromRGBO(35, 35, 35, 1.0),
                                              fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          )),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 205, 56, 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  ),
                                ),
                                SizedBox(width: 16),

                                Text("Fri, 14 Sep 2021", style: TextStyle(
                                    color: Color.fromRGBO(58, 58, 58, 1.0),
                                    fontSize: 14,
                                    fontFamily: "PoppinsRegular"
                                ))
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text("Penang - Kuala Lumpur", style: TextStyle(
                                    color: Color.fromRGBO(58, 58, 58, 1.0),
                                    fontSize: 16,
                                    fontFamily: "PoppinsBold"
                                ))
                              ],
                            ),
                            SizedBox(width: 24)
                          ],
                        ),flex: 1),
                      ],
                    ),

                    SizedBox(height: 16),

                    Container(
                      width: double.maxFinite,
                      height: 1,
                      color: Color.fromRGBO(234, 237, 241, 1.0),
                    ),
                  ],
                ),
              );
            },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: ticket_value.completedTripModelList.length,
              primary: false,
            ) : emptyView(), flex: 1)
          ],
        ),
      ),
    );
  }

  Widget loadingView(){
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 24, right: 24),
      child: Shimmer.fromColors(
        baseColor: Color.fromRGBO(236, 239, 241, 1.0),
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),

              Container(
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),

              SizedBox(height: 24),

              Container(
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),

              SizedBox(height: 24),

              Container(
                width: double.maxFinite,
                height: 55,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emptyView(){
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        children: [
          Text("Oh snap!",
              style: TextStyle(
                  color: Color.fromRGBO(255, 205, 56, 1.0),
                  fontSize: 30,
                  fontFamily: "PoppinsBold"
              )),

          SizedBox(height: 8),

          Text("No trips near you try to search\nwith a different location",
              style: TextStyle(
                  color: Color.fromRGBO(58, 58, 58, 1.0),
                  fontSize: 16,
                  fontFamily: "PoppinsRegular"
              ), textAlign: TextAlign.center)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}