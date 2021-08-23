import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/callback/book_trips_callback.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentDetailsController extends GetxController {

  final count = 0.obs;

  int selectedPayment = 0;

  bool paymentToogle = false;
  bool isChecked = false;

  late List<Map> paymentList;

  late TripModel tripModel;
  String seatList = "";
  String price = "";
  double defaultPrice = 0.0;

  bool isLoading = true;
  String accessToken = "";
  String deviceId = "";
  String deviceToken = "";
  double cashbackBalance = 0.0;

  late TextEditingController cashbackEditingController;
  bool isCashbackApplied = false;
  double cashbackAmount = 0.0;

  @override
  void onInit() {
    cashbackEditingController = TextEditingController();
    if(Get.arguments != null){
      if(Get.arguments["trip_model"] != null){
        tripModel = Get.arguments["trip_model"];
      }

      if(Get.arguments["seat_list"] != null){
        seatList = Get.arguments["seat_list"];
      }

      if(Get.arguments["price"] != null){
        price = Get.arguments["price"];
        defaultPrice = double.parse(price);
      }
    }
    paymentList = [];
    setPaymentList();
    loadUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void loadUser(){
    SharedPreferences.getInstance().then((prefs){
      accessToken = prefs.getString("access_token") ?? "";
      deviceId = prefs.getString("device_id") ?? "";
      deviceToken = prefs.getString("firebase_token") ?? "";
      getBalance();
    });
  }

  void setPaymentToogle(bool paymentToogle) {
    this.paymentToogle = paymentToogle;
    update(["payment_toogle"]);
  }

  void setCashbackApplied(){
    String strCashbackAmount = cashbackEditingController.text.toString().trim();

    if(!isCashbackApplied && strCashbackAmount.isEmpty){
      CustomToast.showToast("Please input amount!");
      return;
    }
    else{
      if(!isCashbackApplied && strCashbackAmount.isNotEmpty){
        double currentCashbackAmount = double.parse(strCashbackAmount);
        if(currentCashbackAmount > cashbackBalance){
          CustomToast.showToast("Usable amount cant not more than cashback amount!");
          return;
        }
      }
    }

    if(isCashbackApplied){
      cashbackEditingController.text = "";
      cashbackAmount = 0.0;
    }
    else{
      if(strCashbackAmount.isNotEmpty){
        cashbackAmount = double.parse(strCashbackAmount);
      }
    }

    isCashbackApplied = !isCashbackApplied;
    countTotalPrice();
    update(["cashback_apply"]);
  }

  void setChecked(bool isChecked) {
    this.isChecked = isChecked;
    update(["checkbox"]);
  }

  void setPaymentList() {
    Map paymentMap = Map();
    paymentMap["image"] = "assets/ic_debit_card.png";
    paymentMap["name"] = "Credit Card / Debit Card";
    paymentMap["description"] = "Use Visa, MasterCard and more";

    Map paymentMap2 = Map();
    paymentMap2["image"] = "assets/ic_online_booking.png";
    paymentMap2["name"] = "Online Banking";
    paymentMap2["description"] = "Internet banking log-in needed";

    paymentList.add(paymentMap);
    paymentList.add(paymentMap2);
  }

  countTotalPrice(){
    double totalPrice = defaultPrice - cashbackAmount;
    price = totalPrice.toString();
    update(["price"]);
  }

  void setSelectedPayment(int index){
    this.selectedPayment = index;
    update(["payment"]);
  }

  Future<void> book(BookTripsCallback bookTripsCallback) async {

    if(!isChecked){
      CustomToast.showToast("Please check the ticketing policy!");
      return;
    }

    bookTripsCallback.onBookTripsLoading();

    Map body = new Map();
    body["id"] = tripModel.id;
    body["payment_method"] = selectedPayment == 0 ? "credit_card" : "online_banking";
    body["seat_no"] = seatList;

    if(cashbackAmount != 0.0){
      body["cashback"] = cashbackAmount;

    }

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).post(MyConstant.BOOK,
        data: body).then((response) {

      Map responseMap = response.data;

      if(responseMap["error"] != null){
        String error = responseMap["error"];
        bookTripsCallback.onBookTripsSuccess(error, "", "error");
      }
      else{
        Map senangMap = responseMap["senangpay"];
        String url = senangMap["url"];
        bookTripsCallback.onBookTripsSuccess("Successfully book!", url, "success");
      }

    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          if(errorCode == 401){
            bookTripsCallback.onBookTripsFailed(errorCode,MyConstant.UNAUTHORIZED_ERROR);
          }
          else{
            bookTripsCallback.onBookTripsFailed(errorCode,MyConstant.UNKNOWN_ERROR);
          }
          print(response);
        }
        catch(error){
          bookTripsCallback.onBookTripsFailed(0,MyConstant.UNKNOWN_ERROR);
          print(error);
        }
        print(error);
      }
      else{
        bookTripsCallback.onBookTripsFailed(0,MyConstant.UNKNOWN_ERROR);
      }
    });
  }

  Future<void> getBalance() async {
    isLoading = true;
    update(["balance"]);

    Map body = new Map();
    body["device_id"] = deviceId;
    body["device_token"] = deviceToken;
    body["app_version"] = "1.0.0";

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).post(MyConstant.AUTHENTICATE,
        data: body).then((response) {

      Map responseMap = response.data;
      Map userMap = responseMap["user"];
      String cashbackBalance = userMap["cashback_balance"];
      this.cashbackBalance = double.parse(cashbackBalance);

      isLoading = false;
      update(["balance"]);
    }).catchError((error){
      if(error is DioError){
        print(error);
      }
      else{
        print(error);
      }
    });
  }
}