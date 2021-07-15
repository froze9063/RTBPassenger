import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridethebee/app/modules/cashback_wallet/controllers/cashback_wallet_controller.dart';

class EarnedTab extends StatelessWidget {

  CashbackWalletController _cashbackWalletController;

  EarnedTab(this._cashbackWalletController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
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
                    fontSize: 14,
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

            Expanded(child: ListView.builder(
                itemBuilder: (context, index){
                  return Container(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(24),
                          child: Row(
                            children: [
                              Image.asset("assets/img_ridethebees.png",height: 55, width: 55),
                              SizedBox(width: 24),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Kuala Lumpur - Penang", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 14,
                                      fontFamily: "PoppinsBold"
                                  )),
                                  SizedBox(height: 8),
                                  Text("14-06-2021", style: TextStyle(
                                      color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 12,
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
                                             Text("\$5.00", style: TextStyle(
                                                 color: Color.fromRGBO(204, 204, 204, 1.0), fontSize: 16,
                                                 fontFamily: "PoppinsMedium"
                                             ))
                                           ],
                                         ),
                                         SizedBox(height: 8),
                                         Row(
                                           children: [
                                             SizedBox(width: 15),
                                             Text("\$20.00", style: TextStyle(
                                                 color: Color.fromRGBO(63, 61, 86, 1.0), fontSize: 16,
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
              itemCount: 5,
              primary: false,
            ), flex: 1)
          ],
        ),
      ),
    );
  }
}