import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:weather_app/models/Weather.dart";

class FetchWeatherAPI{
  Hourly? hourly;
  Future<Hourly> getData() async{
    final response= await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m,relativehumidity_2m,precipitation_probability,cloudcover,windspeed_80m&forecast_days=1"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      //print(data);
      return Hourly.fromJson(data);
    }
    else{
    return Hourly.fromJson(data);
    }
  }

}