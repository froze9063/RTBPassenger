import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class PitStopController extends GetxController {
  //TODO: Implement PitStopController

  final count = 0.obs;

  late CameraPosition kGooglePlex;
  late Completer<GoogleMapController> gmapController;
  late GoogleMapController googleMapController;
  late LocationData locationDataUser;

  @override
  void onInit() {
    gmapController = Completer();
    kGooglePlex = CameraPosition(target: LatLng(1.3567349, 103.9683205), zoom: 16);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void checkCurrentLocation(BuildContext context) async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {

      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted != PermissionStatus.granted) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted == PermissionStatus.denied) {
        _showMyDialog(context);
      }
      else if (_permissionGranted == PermissionStatus.deniedForever){
        _showMyDialog(context);
      }
      else if (_permissionGranted == PermissionStatus.granted){
        location.onLocationChanged.listen((LocationData currentLocation) {
          locationDataUser = currentLocation;
          moveToCurrentLocation();
        });
      }
      else{
        print("Nothing");
      }
    }
    else{
      location.onLocationChanged.listen((LocationData currentLocation) {
        locationDataUser = currentLocation;
        moveToCurrentLocation();
      });
    }
  }

  void moveToCurrentLocation(){
    if(locationDataUser != null && googleMapController != null){
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(locationDataUser.latitude ?? 0.0, locationDataUser.longitude ?? 0.0),
        zoom: 16.0,)));
      update(["update_map"]);
    }
  }

  Future<Null> _showMyDialog(BuildContext context) async {
    String returnVal =  await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('LOCATION PERMISSION NEEDED!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please enable your location permission to continue..'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context,'failed');
              },
            ),
            FlatButton(
              child: Text('SETTING'),
              onPressed: () {
                AppSettings.openAppSettings();
              },
            ),
          ],
        );
      },
    );

    if (returnVal == "success"){

    }
    else if (returnVal == "failed"){
      if (Platform.isAndroid) {
        Navigator.pop(context);
      }
      else if (Platform.isIOS) {

      }
    }
    else{
      print("NULL");
    }
  }
}

