import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ridethebee/app/connection/connection.dart';
import 'package:ridethebee/app/constant/my_constant.dart';
import 'package:ridethebee/app/model/driver_model.dart';
import 'package:ridethebee/app/model/trip_model.dart';
import 'package:ridethebee/app/modules/car_seats/views/car_seats_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketDetailsBookController extends GetxController {

  final count = 0.obs;

  late TripModel tripModel;
  late DriverModel driverModel;

  String accessToken = "";
  int tripId = 2;
  bool isLoaded = false;

  @override
  void onInit() {
    if(Get.arguments != null){
      if(Get.arguments["trip_id"] != null){
        tripId = Get.arguments["trip_id"];
      }
    }
    driverModel = DriverModel(0,"","","","");
    tripModel = TripModel(0, 0, 0, "", "", "", "", "", "", "", "", "",
        "", "", "", driverModel);
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
      loadDetailTrip();
    });
  }

  void goToSeatBook(){
    if(isLoaded){
      Get.to(() => CarSeatsView(), arguments: {"trip_id" : tripId,
        "trip_model" : tripModel});
    }
  }

  void loadDetailTrip(){
    MyConnection myConnection = new MyConnection();
    myConnection.getDioConnection(accessToken).get("${MyConstant.TRIPS_DETAIL}/$tripId").then((response) {
      Map responseMap = response.data;
      Map dataMap = responseMap["data"];

      int id = dataMap["id"] ?? 0;
      int bus_id = dataMap["bus_id"] ?? 0;
      int driver_id = dataMap["driver_id"] ?? 0;
      String date = dataMap["date"] ?? "";
      String depart_time = dataMap["depart_time"] ?? "";
      String arrival_time = dataMap["arrival_time"] ?? "";
      String price = dataMap["price"] ?? "";
      String hotline_no = dataMap["hotline_no"] ?? "";
      String client = dataMap["client"] ?? "";
      String client_img = dataMap["client_img"] ?? "";
      String from = dataMap["from"] ?? "";
      String to = dataMap["to"] ?? "";
      String station_from = dataMap["station_from"] ?? "";
      String station_to = dataMap["station_to"] ?? "";
      String bus_no = dataMap["bus_no"] ?? "";

      if(dataMap["driver"] != null){
        Map driverMap = dataMap["driver"];
        int driverId = driverMap["id"] ?? 0;
        String name = driverMap["name"];
        String contact = driverMap["contact"];
        String img = driverMap["img"];
        String rating = driverMap["rating"];
        driverModel = DriverModel(driverId, name, contact, img, rating);
      }

      tripModel = TripModel(id, bus_id, driver_id, date, depart_time, arrival_time,
          price, hotline_no, client, client_img, from, to, station_from, station_to,
          bus_no, driverModel);

      isLoaded = true;
      update(["detail_trip"]);

    }).catchError((error){
      if(error is DioError){
        try{
          var response = error.response;
          int errorCode = response?.statusCode ?? 0;
          Map jsonMap = response?.data;

          if(jsonMap != null){
            String error = jsonMap["message"];
            print(error);
          }
          else{
            print(response);
          }

          print(response);
        }
        catch(error){
          print(error);
        }

        print(error);
      }
      else{
        print(error);
      }
    });
  }
}
