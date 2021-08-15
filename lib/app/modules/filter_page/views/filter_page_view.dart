import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/filter_page_controller.dart';

class FilterPageView extends GetView<FilterPageController> {

  FilterPageController _filterPageController = Get.put(FilterPageController());

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
                  Text("Filter", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(63, 61, 86, 1.0),
                      fontFamily: "PoppinsBold"
                  ), textAlign: TextAlign.center,)
                ],
              ),
            ),

            Column(
              children: [
                SizedBox(height: 115),
                Expanded(child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: SingleChildScrollView(
                            child: Column(
                              children: [
                                GetBuilder<FilterPageController>(
                                  id: "companies",
                                  init: FilterPageController(),
                                  builder: (value) => Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 24),
                                        Text("Companies", style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(63, 61, 86, 1.0),
                                            fontFamily: "PoppinsMedium"
                                        ), textAlign: TextAlign.center),
                                        Expanded(child: SizedBox(),flex: 1),
                                        GestureDetector(
                                          child: Container(
                                            width: 55,
                                            height: 55,
                                            color: Colors.white,
                                            child: Center(
                                              child:  Image.asset(value.companyShowed ? "assets/ic_circle_up.png" :
                                              "assets/ic_circle_down.png", height: 24, width: 24),
                                            ),
                                          ),
                                          onTap: (){
                                            if(!value.isLoading){
                                              value.setShow(!value.companyShowed, 0);
                                            }
                                          },
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),

                                    value.isLoading ? loadingView() : Visibility(child: ListView.builder(itemBuilder: (context,index) {
                                      Map companyMap = value.companiesList[index];
                                      return GestureDetector(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 14, right: 24),
                                          color: Colors.white,
                                          padding: EdgeInsets.only(top: index == 0 ? 8 : 0),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                  value: companyMap["selected"],
                                                  activeColor: Color.fromRGBO(255, 205, 56, 1.0),
                                                  onChanged: (values){
                                                    value.setSelected(!value.companiesList[index]["selected"], index, 0);
                                                  }),
                                              SizedBox(width: 8),
                                              Text(companyMap["name"], style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(63, 61, 86, 1.0),
                                                  fontFamily: "PoppinsMedium"
                                              ), textAlign: TextAlign.center),
                                            ],
                                          ),
                                        ),
                                        onTap: (){
                                          value.setSelected(!value.companiesList[index]["selected"], index, 0);
                                        },
                                      );
                                    },
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: EdgeInsets.zero,
                                      itemCount: value.companiesList.length,
                                    ), visible: value.companyShowed),

                                    SizedBox(height: 16),

                                    Container(
                                      margin: EdgeInsets.only(left: 24, right: 24),
                                      width: double.maxFinite,
                                      height: 1,
                                      color: Color.fromRGBO(236, 239, 241, 1.0),
                                    ),
                                  ],
                                )),

                                SizedBox(height: 16),

                                GetBuilder<FilterPageController>(
                                  id: "pick_up",
                                  init: FilterPageController(),
                                  builder: (value) => Column(children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 24),
                                      Text("Pick Up", style: TextStyle(
                                          fontSize: 16,
                                          color: Color.fromRGBO(63, 61, 86, 1.0),
                                          fontFamily: "PoppinsMedium"
                                      ), textAlign: TextAlign.center),
                                      Expanded(child: SizedBox(),flex: 1),
                                      GestureDetector(
                                        child: Container(
                                          width: 55,
                                          height: 55,
                                          color: Colors.white,
                                          child: Center(
                                            child: Image.asset(value.pickUpShowed ? "assets/ic_circle_up.png" :
                                            "assets/ic_circle_down.png", height: 24, width: 24),
                                          ),
                                        ),
                                        onTap: (){
                                          if(!value.isLoading){
                                            value.setShow(!value.pickUpShowed, 1);
                                          }
                                        },
                                      ),
                                      SizedBox(width: 10)
                                    ],
                                  ),

                                  value.isLoading ? loadingView() : Visibility(child: ListView.builder(itemBuilder: (context,index) {
                                    Map pickupMap = value.pickupList[index];
                                    return GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 14, right: 24),
                                        color: Colors.white,
                                        padding: EdgeInsets.only(top: index == 0 ? 8 : 0),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                                value: pickupMap["selected"],
                                                activeColor: Color.fromRGBO(255, 205, 56, 1.0),
                                                onChanged: (values){
                                                  value.setSelected(!value.pickupList[index]["selected"], index, 1);
                                                }),
                                            SizedBox(width: 8),
                                            Text(pickupMap["name"], style: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                                fontFamily: "PoppinsMedium"
                                            ), textAlign: TextAlign.center),
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        value.setSelected(!value.pickupList[index]["selected"], index, 1);
                                      },
                                    );
                                  },
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: EdgeInsets.zero,
                                    itemCount: value.pickupList.length,
                                  ), visible: value.pickUpShowed),

                                  SizedBox(height: 24),

                                  Container(
                                    margin: EdgeInsets.only(left: 24, right: 24),
                                    width: double.maxFinite,
                                    height: 1,
                                    color: Color.fromRGBO(236, 239, 241, 1.0),
                                  ),
                                ])),

                                SizedBox(height: 16),

                                GetBuilder<FilterPageController>(
                                  id: "drop_off",
                                  init: FilterPageController(),
                                  builder: (value) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 24),
                                        Text("Drop Off", style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(63, 61, 86, 1.0),
                                            fontFamily: "PoppinsMedium"
                                        ), textAlign: TextAlign.center),
                                        Expanded(child: SizedBox(),flex: 1),
                                        GestureDetector(
                                          child: Container(
                                            width: 55,
                                            height: 55,
                                            color: Colors.white,
                                            child: Center(
                                              child: Image.asset(value.dropOffShowed ? "assets/ic_circle_up.png" :
                                              "assets/ic_circle_down.png", height: 24, width: 24),
                                            ),
                                          ),
                                          onTap: (){
                                             if(!value.isLoading){
                                               value.setShow(!value.dropOffShowed, 2);
                                             }
                                          },
                                        ),
                                        SizedBox(width: 10)
                                      ],
                                    ),

                                    value.isLoading ? loadingView() : Visibility(child: ListView.builder(itemBuilder: (context,index) {
                                      Map dropMap = value.dropoffList[index];
                                      return GestureDetector(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 14, right: 24),
                                          color: Colors.white,
                                          padding: EdgeInsets.only(top: index == 0 ? 8 : 0),
                                          child: Row(
                                            children: [
                                              Checkbox(
                                                  value: dropMap["selected"],
                                                  activeColor: Color.fromRGBO(255, 205, 56, 1.0),
                                                  onChanged: (values){
                                                    value.setSelected(!value.dropoffList[index]["selected"], index, 2);
                                                  }),
                                              SizedBox(width: 8),
                                              Text(dropMap["name"], style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(63, 61, 86, 1.0),
                                                  fontFamily: "PoppinsMedium"
                                              ), textAlign: TextAlign.center),
                                            ],
                                          ),
                                        ),
                                        onTap: (){
                                          value.setSelected(!value.dropoffList[index]["selected"], index, 2);
                                        },
                                      );
                                    },
                                      shrinkWrap: true,
                                      primary: false,
                                      padding: EdgeInsets.zero,
                                      itemCount: value.dropoffList.length,
                                    ), visible: value.dropOffShowed),

                                    SizedBox(height: 16),
                                  ],
                                ))
                              ],
                            ),
                          ), flex: 1),
                          Padding(padding: EdgeInsets.only(left: 24, right: 24, top: 24), child: GestureDetector(
                            child: ColoredButton(height: 55, width: double.maxFinite, title: "Filter",
                                color: Color.fromRGBO(255, 205, 56, 1.0)),
                            onTap: (){
                              _filterPageController.filter();
                            },
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  child: Container(
                    width: 100,
                    height: 55,
                    color: Colors.transparent,
                    child: Center(
                      child: Text("Reset",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "PoppinsBold",
                              color: Color.fromRGBO(255, 205, 56, 1.0)
                          )),
                    ),
                  ),
                  onTap: (){
                    _filterPageController.reset();
                  },
                ),
                SizedBox(height: 8),
              ],
            ),
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
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 15,
              decoration: BoxDecoration(
                color: Color.fromRGBO(236, 239, 241, 1.0),
                borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
            ),

            SizedBox(height: 16),

            Container(
              width: double.maxFinite,
              height: 15,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 239, 241, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
            ),

            SizedBox(height: 16),

            Container(
              width: double.maxFinite,
              height: 15,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 239, 241, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
            )
          ],
        ),
      ),
    );
  }
}
