import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/model/cashback_model.dart';
import 'package:ridethebee/app/modules/cashback_wallet/controllers/cashback_wallet_controller.dart';
import 'package:shimmer/shimmer.dart';

class RedeemedTab extends StatelessWidget {

  CashbackWalletController _cashbackWalletController;

  RedeemedTab(this._cashbackWalletController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: GetBuilder<CashbackWalletController>(
          id: "redeemed_cashback",
          init: CashbackWalletController(),
          builder: (redeemed_value) => Column(
            children: [
              SizedBox(height: 24),
              Row(
                children: [
                  SizedBox(width: 24),
                  Expanded(child: Text("Transaction History", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(135, 141, 156, 1.0),
                      fontFamily: "PoppinsRegular"
                  )), flex: 1),
                  Text("Cashback", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(20, 212, 97, 1.0),
                      fontFamily: "PoppinsMedium"
                  )),
                  SizedBox(width: 24),
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 24),
                width: double.maxFinite,
                height: 1,
                color: Color.fromRGBO(234, 237, 241, 1.0),
              ),

              Expanded(child: redeemed_value.isRedeemedLoading ? loadingView() : redeemed_value.redeemedCashbackList.length > 0 ? ListView.builder(
                itemBuilder: (context, index){
                  CashbackModel cashbackModel = redeemed_value.redeemedCashbackList[index];
                  return Container(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color.fromRGBO(255, 205, 56, 1.0),
                                radius: 28.0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 26.0,
                                  backgroundImage: NetworkImage(cashbackModel.client_img),
                                ),
                              ),
                              SizedBox(width: 24),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${cashbackModel.from} - ${cashbackModel.to}",
                                      style: TextStyle(
                                          color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 14,
                                          fontFamily: "PoppinsBold"
                                      )),
                                  SizedBox(height: 8),
                                  Text("${cashbackModel.date}", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 14,
                                      fontFamily: "PoppinsRegular"
                                  ))
                                ],
                              ), flex: 1),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/ic_minus_grey.png", width: 15, height: 10),
                                          SizedBox(width: 4),
                                          Text("\$${cashbackModel.amount}", style: TextStyle(
                                              color: Color.fromRGBO(204, 204, 204, 1.0), fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          ))
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          SizedBox(width: 15),
                                          Text("\$20.00", style: TextStyle(
                                              color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 14,
                                              fontFamily: "PoppinsMedium"
                                          ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: Color.fromRGBO(234, 237, 241, 1.0),
                        )
                      ],
                    ),
                  );
                },
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: redeemed_value.redeemedCashbackList.length,
                primary: false,
              ) : emptyView(), flex: 1)
            ],
          ),
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
                height: 75,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),

              SizedBox(height: 24),

              Container(
                width: double.maxFinite,
                height: 75,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 239, 241, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
              ),

              SizedBox(height: 24),

              Container(
                width: double.maxFinite,
                height: 75,
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
    return Column(
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
    );
  }
}
