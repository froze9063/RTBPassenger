import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/payment_successfull/views/payment_successfull_view.dart';
import 'package:ridethebee/app/widgets/colored_button.dart';

import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> {

  PaymentDetailsController _paymentDetailsController = Get.put(PaymentDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(24),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: Image.asset("assets/ic_new_back_yellow.png", height: 18, width: 18),
                              onTap: (){
                                Get.back();
                              },
                            ),
                            Expanded(child: Text("Payment Details",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "PoppinsBold",
                                    color: Color.fromRGBO(63, 61, 86, 1.0)
                                ))),
                            SizedBox(width: 24),
                          ],
                        ),

                        SizedBox(height: 24),

                        Text("Select Payment Method",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "PoppinsMedium",
                                color: Color.fromRGBO(135, 141, 156, 1.0)
                            )),

                        ListView.builder(itemBuilder: (context, index){
                          return Padding(
                            padding: EdgeInsets.only(top: 24),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(index == 0 ? "assets/ic_debit_card.png" : "assets/ic_online_booking.png",
                                        height: 36,width: 36),
                                    SizedBox(width: 16),
                                    Expanded(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(index == 0 ? "Credit Card / Debit Card" : "Online Banking",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(58, 58, 58, 1.0),
                                                    fontSize: 16,
                                                    fontFamily: "PoppinsMedium"
                                                ))
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(index == 0 ? "Use Visa, MasterCard and more" : "Internet banking log-in needed",
                                                style: TextStyle(
                                                  color: Color.fromRGBO(135, 141, 156, 1.0),
                                                  fontSize: 14,
                                                  fontFamily: "PoppinsRegular",
                                                ))
                                          ],
                                        ),
                                        SizedBox(width: 24)
                                      ],
                                    ),flex: 1),
                                    SizedBox(width: 16),
                                    Image.asset(index == 0 ? "assets/ic_yellow_check.png" : "assets/ic_unselected_payment.png", width: 24, height: 24, fit: BoxFit.cover)
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: 2,
                          primary: false,
                        )
                      ],
                    ),
                  ),

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
                                  Text("RM10.00",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "PoppinsBold",
                                          color: Color.fromRGBO(22, 212, 98, 1.0)
                                      ))
                                ],
                              ),

                              SizedBox(height: 16),

                              Container(
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
                                    Expanded(child: Text("Input Amount", style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(135, 141,156, 1.0),
                                        fontFamily: "PoppinsMedium"
                                    ))),
                                    Container(
                                      padding: EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(255, 205, 56, 1.0),
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8))
                                      ),
                                      child: Text("Apply", style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontFamily: "PoppinsBold"
                                      )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ), visible: value.paymentToogle),
                        )
                      ],
                    ),
                  ),

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
                            Expanded(child: Text("Ticket x 1", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                fontFamily: "PoppinsRegular"
                            )), flex: 1),
                            Text("\$35.00", style: TextStyle(
                                fontSize: 16,
                                fontFamily: "PoppinsMedium",
                                color: Color.fromRGBO(63, 61, 86, 1.0)
                            ))
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: Text("Used Cashback", style: TextStyle(
                                fontSize: 16,
                                fontFamily: "PoppinsRegular",
                                color: Color.fromRGBO(63, 61, 86, 1.0)
                            )), flex: 1),
                            Text("-\$10.00", style: TextStyle(
                                fontSize: 16,
                                fontFamily: "PoppinsMedium",
                                color: Color.fromRGBO(63, 61, 86, 1.0)
                            ))
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: Text("Total",style: TextStyle(
                                fontSize: 16,
                                fontFamily: "PoppinsBold",
                                color: Color.fromRGBO(63, 61, 86, 1.0)
                            )), flex: 1),
                            Text("RM25.00",style: TextStyle(
                                fontSize: 20,
                                fontFamily: "PoppinsBold",
                                color: Color.fromRGBO(22, 212, 98, 1.0)
                            ))
                          ],
                        )
                      ],
                    ),
                  ),

                  Container(
                    width: double.maxFinite,
                    color: Color.fromRGBO(250, 250, 250, 1.0),
                    padding: EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 16),
                    child: Row(
                      children: [
                        Checkbox(value: false, onChanged: (value){

                        }),
                        SizedBox(width: 16),
                        Expanded(child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "I agree on Ride The Bee’s ",
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
                Get.to(() => PaymentSuccessfullView());
              },
            ))
          ],
        ),
      ),
    );
  }
}
