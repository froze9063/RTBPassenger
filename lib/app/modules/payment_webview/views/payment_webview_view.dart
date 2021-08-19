import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridethebee/app/modules/payment_successfull/views/payment_successfull_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/payment_webview_controller.dart';

class PaymentWebviewView extends GetView<PaymentWebviewController> {

  PaymentWebviewController _paymentWebviewController = Get.put(PaymentWebviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 3.0,
        backgroundColor: Colors.white,
        title: Text("Payment", style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(58, 58, 58, 1.0),
            fontFamily: "PoppinsMedium"
        )),
        leading: IconButton(
            icon: Icon(CupertinoIcons.left_chevron, color: Colors.black),
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: _paymentWebviewController.url,
          onPageStarted: (url){
             if(url.startsWith("https://ridethebee-staging.vecapital.asia/senangpay/")){
               String parssedUrl = url.split("&")[1];
               String parssedStatusUrl = parssedUrl.split("=")[1];

               String parssedTicketUrl = url.split("&")[2];
               String strTicketId = parssedTicketUrl.split("=")[1];

               String parssedTransactionUrl = url.split("&")[3];
               String strTransactionId = parssedTransactionUrl.split("=")[1];

               if(parssedStatusUrl == "1"){
                 Get.back();
                 Get.offAll(() => PaymentSuccessfullView(), arguments: {
                   "trip_model" : _paymentWebviewController.tripModel,
                   "seat_list" : _paymentWebviewController.seatList,
                   "price" : _paymentWebviewController.price,
                   "selected_payment" : _paymentWebviewController.selectedPayment,
                   "ticket_id" : strTicketId,
                   "transaction_id" : strTransactionId,
                 });
               }
             }
          },
        ),
      ),
    );
  }
}

//https://ridethebee-staging.vecapital.asia/senangpay/result?&status_id=0&order_id=INV-21080030&transaction_id=162911649956138281&msg=The_payment_was_declined._Please_contact_your_bank._Thank_you._&hash=f6d0403c834f6a583be1847e73bd1af3
//https://ridethebee-staging.vecapital.asia/senangpay/result?&status_id=2&order_id=INV-21080031&transaction_id=162911656769438289&msg=Pending_Authorization&hash=18159ab2a135fe47cb80cc7e05862ba5