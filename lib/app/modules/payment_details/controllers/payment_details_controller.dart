import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/callback/book_trips_callback.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/widgets/custom_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentDetailsController extends GetxController {

  final count = 0.obs;

  int selectedPayment = -1;

  bool paymentToogle = false;
  bool isChecked = false;

  late List<Map> paymentList;

  late TripModel tripModel;
  String seatList = "";
  String price = "";

  String accessToken = "";

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["trip_model"] != null){
        tripModel = Get.arguments["trip_model"];
      }

      if(Get.arguments["seat_list"] != null){
        seatList = Get.arguments["seat_list"];
      }

      if(Get.arguments["price"] != null){
        price = Get.arguments["price"];
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
    });
  }

  void setPaymentToogle(bool paymentToogle) {
    this.paymentToogle = paymentToogle;
    update(["payment_toogle"]);
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

  void setSelectedPayment(int index){
    this.selectedPayment = index;
    update(["payment"]);
  }

  Future<void> book(BookTripsCallback bookTripsCallback) async {

    if(selectedPayment == -1){
      CustomToast.showToast("Please choose payment method!");
      return;
    }

    bookTripsCallback.onBookTripsLoading();

    Map body = new Map();
    body["id"] = tripModel.id;
    body["payment_method"] = selectedPayment == 0 ? "credit_card" : "online_banking";
    body["seat_no"] = seatList;

    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).post(MyConstant.BOOK,
        data: body).then((response) {

      Map responseMap = response.data;
      Map senangMap = responseMap["senangpay"];
      String url = senangMap["url"];

      bookTripsCallback.onBookTripsSuccess("Successfully book!", url, "success");

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
}