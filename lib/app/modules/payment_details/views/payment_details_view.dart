import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/callback/book_trips_callback.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/modules/payment_webview/views/payment_webview_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';
import 'package:ridethebee/app/widgets/custom_loading.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> implements BookTripsCallback{

  PaymentDetailsController _paymentDetailsController = Get.put(PaymentDetailsController());
  late BuildContext _buildContext;

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MyConstant.headerTopMargin),

                Row(
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.transparent,
                        child: Center(
                          child: Image.asset("assets/ic_new_back_yellow.png", height: 18, width: 18),
                        ),
                      ),
                      onTap: (){
                        Get.back();
                      },
                    ),
                    Expanded(child: Text("Payment Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "PoppinsBold",
                            color: Color.fromRGBO(63, 61, 86, 1.0)
                        ))),
                    GestureDetector(
                      child: Container(
                        width: 55,
                        height: 55,
                        color: Colors.transparent,
                      ),
                      onTap: (){

                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),

                GetBuilder<PaymentDetailsController>(
                  id: "balance",
                  init: PaymentDetailsController(),
                  builder: (value) => Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 16),
                  color: Colors.white,
                  child: value.isLoading ? loadingView() : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            child: Image.asset("assets/ic_cashback_wallet.png", height: 45, width: 45),
                            onTap: (){
                              Get.back();
                            },
                          ),
                          SizedBox(width: 16),
                          Expanded(child: Text("My Cashback Wallet",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "PoppinsMedium",
                                  color: Color.fromRGBO(63, 61, 86, 1.0)
                              ))),

                          GetBuilder<PaymentDetailsController>(
                              id: "payment_toogle",
                              init: PaymentDetailsController(),
                              builder: (value) => FlutterSwitch(
                                width: 55.0,
                                height: 25.0,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                inactiveColor: Colors.white,
                                activeColor:  Colors.white,
                                toggleColor: Color.fromRGBO(255, 205, 56, 1.0),
                                switchBorder: Border.all(
                                    color: Color.fromRGBO(220, 220, 220, 1.0)
                                ),
                                value: value.paymentToogle,
                                onToggle: (val) {
                                  print("$val");
                                  value.setPaymentToogle(val);
                                },
                              ))
                        ],
                      ),

                      GetBuilder<PaymentDetailsController>(
                        id: "payment_toogle",
                        init: PaymentDetailsController(),
                        builder: (value) => Visibility(child: Column(
                          children: [
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text("Usable amount:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "PoppinsRegular",
                                        color: Color.fromRGBO(135, 141, 156, 1.0)
                                    )),
                                SizedBox(width: 4),
                                Text("RM${value.cashbackBalance}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "PoppinsBold",
                                        color: Color.fromRGBO(22, 212, 98, 1.0)
                                    ))
                              ],
                            ),

                            SizedBox(height: 16),

                            GetBuilder<PaymentDetailsController>(
                                init: PaymentDetailsController(),
                                id: "cashback_apply",
                                builder: (apply_value) => Container(
                                  width: double.maxFinite,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                        color: Color.fromRGBO(240, 240, 239, 1.0),
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 16),
                                      Expanded(child: TextField(
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        controller: apply_value.cashbackEditingController,
                                        decoration: InputDecoration.collapsed(
                                            hintText: "Input Amount",
                                            hintStyle: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(135, 141,156, 1.0),
                                                fontFamily: "PoppinsMedium"
                                            )
                                        ),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "PoppinsMedium",
                                            color: Color.fromRGBO(63, 61, 86, 1.0)
                                        ),
                                      )),

                                      GestureDetector(
                                        child: Container(
                                          padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                                          decoration: BoxDecoration(
                                              color: !apply_value.isCashbackApplied ? Color.fromRGBO(255, 205, 56, 1.0) : Color.fromRGBO(255, 0, 0, 1.0),
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(8),
                                                  bottomRight: Radius.circular(8))
                                          ),
                                          child: Text(!apply_value.isCashbackApplied ? "Apply" : "Remove", style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontFamily: "PoppinsBold"
                                          )),
                                        ),
                                        onTap: (){
                                          apply_value.setCashbackApplied();
                                        },
                                      )
                                    ],
                                  ),
                                ))

                          ],
                        ), visible: value.paymentToogle),
                      )
                    ],
                  )
                )),

                Container(
                  width: double.maxFinite,
                  height: 10,
                  color: Color.fromRGBO(250, 250, 250, 1.0),
                ),

                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(24),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Subtotal",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "PoppinsMedium",
                              color: Color.fromRGBO(135, 141, 156, 1.0)
                          )),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: Text("Ticket x ${_paymentDetailsController.seatList.split(",").length}", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontFamily: "PoppinsRegular"
                          )), flex: 1),
                          Text("\$${_paymentDetailsController.price}", style: TextStyle(
                              fontSize: 16,
                              fontFamily: "PoppinsMedium",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          ))
                        ],
                      ),
                      GetBuilder<PaymentDetailsController>(
                        id: "payment_toogle",
                        init: PaymentDetailsController(),
                        builder: (value) => Visibility(child: Column(
                        children: [
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: Text("Used Cashback", style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "PoppinsRegular",
                                  color: Color.fromRGBO(63, 61, 86, 1.0)
                              )), flex: 1),
                              GetBuilder<PaymentDetailsController>(
                                  id: "cashback_apply",
                                  init: PaymentDetailsController(),
                                  builder: (apply_value) => Text("-\$${apply_value.cashbackAmount}", style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "PoppinsMedium",
                                  color: Color.fromRGBO(63, 61, 86, 1.0)
                              )))
                            ],
                          )
                        ],
                      ), visible: value.paymentToogle)),
                      SizedBox(height: 16),
                      GetBuilder<PaymentDetailsController>(
                        id: "price",
                        init: PaymentDetailsController(),
                        builder: (value) => Row(
                        children: [
                          Expanded(child: Text("Total",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "PoppinsBold",
                              color: Color.fromRGBO(63, 61, 86, 1.0)
                          )), flex: 1),
                          Text("RM${value.price}",style: TextStyle(
                              fontSize: 20,
                              fontFamily: "PoppinsBold",
                              color: Color.fromRGBO(22, 212, 98, 1.0)
                          ))
                        ],
                      ))
                    ],
                  ),
                ),

                Container(
                  width: double.maxFinite,
                  color: Color.fromRGBO(250, 250, 250, 1.0),
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 16),
                  child: Row(
                    children: [
                      GetBuilder<PaymentDetailsController>(
                        id: "checkbox",
                        init: PaymentDetailsController(),
                        builder: (values) => Container(
                        width: 55,
                        height: 55,
                        color: Colors.transparent,
                        child: Checkbox(
                            value: values.isChecked,
                            activeColor: Color.fromRGBO(255, 205, 56, 1.0),
                            onChanged: (value){
                          values.setChecked(!values.isChecked);
                        }),
                      )),

                      Expanded(child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "I agree on Ride The Bee???s ",
                              style: TextStyle(color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                fontFamily: "PoppinsRegular",
                              )),
                          TextSpan(
                              text: "ticketing policy",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 205, 56, 1.0),
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontFamily: "PoppinsBold",
                              )),

                          TextSpan(
                              text: ". Please be at the pick-up point at least 30 minutes before scheduled departure.",
                              style: TextStyle(
                                color: Color.fromRGBO(63, 61, 86, 1.0),
                                fontWeight: FontWeight.normal,
                                height: 1.5,
                                fontFamily: "PoppinsRegular",
                              ))
                        ]),
                      ), flex: 1)
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )
              ],
            ),
          ), flex: 1),

          Padding(padding: EdgeInsets.all(24), child: GestureDetector(
            child: ColoredButton(height: 55, width: double.maxFinite, title: "Pay Now",
                color: Color.fromRGBO(255, 205, 56, 1.0)),
            onTap: (){
               _paymentDetailsController.book(this);
            },
          ))
        ],
      ),
    );
  }

  Widget loadingView(){
    return Container(
      width: double.maxFinite,
      child: Shimmer.fromColors(
        baseColor: Color.fromRGBO(236, 239, 241, 1.0),
        highlightColor: Colors.white,
        child: Container(
          width: double.maxFinite,
          height: 35,
          decoration: BoxDecoration(
              color: Color.fromRGBO(236, 239, 241, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
        ),
      ),
    );
  }

  @override
  void onBookTripsLoading() {
    CustomLoading.showLoadingDialog(_buildContext);
  }

  @override
  void onBookTripsSuccess(String message, String url, String status) {
    if(status == "success"){
      Get.back();
      CustomToast.showToast(message);
      Get.back();
      Get.to(() => PaymentWebviewView(), arguments: {"url" : url,
        "trip_model" : _paymentDetailsController.tripModel,
        "seat_list" : _paymentDetailsController.seatList,
        "price" : _paymentDetailsController.price,
        "selected_payment" : _paymentDetailsController.selectedPayment,
      });
    }
    else{
      Get.back();
      CustomToast.showToast(message);
    }
  }

  @override
  void onBookTripsFailed(int errorCode, String message) {
    Get.back();
    CustomToast.showToast(message);
  }
}
