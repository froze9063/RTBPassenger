import 'driver_model.dart';

class TripModel {
  int id = 0;
  int bus_id = 0;
  int driver_id = 0;
  String date = "";
  String depart_time = "";
  String arrival_time = "";
  String price = "";
  String hotline_no = "";
  String client = "";
  String client_img = "";
  String from = "";
  String to = "";
  String station_from = "";
  String station_to = "";
  String bus_no = "";
  DriverModel driverModel;

  TripModel(this.id, this.bus_id, this.driver_id, this.date, this.depart_time,
    this.arrival_time, this.price, this.hotline_no, this. client, this.client_img,
    this.from, this.to, this.station_from, this.station_to, this.bus_no,
    this.driverModel);
}