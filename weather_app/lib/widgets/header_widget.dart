import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city="";
  final GlobalController globalController=Get.put(GlobalController(),permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude().value,globalController.getLongitude().value);
    super.initState();
  }

  getAddress(latitude,longitude) async{
    List<Placemark> placemark=await placemarkFromCoordinates(latitude, longitude,localeIdentifier: "en");
    if (placemark.isNotEmpty) {
      Placemark place = placemark[0];
      setState(() {
        print(placemark);
        city = place.locality ?? "Unknown";
      });
    } else {
      setState(() {
        city = "Unknown";
      }); print(placemark);
    Placemark place= placemark[0];
    setState(() {
      city=place.locality!;
    });
  }}
  
  @override
  Widget build(BuildContext context) {
    return Text(city);
  }
}
