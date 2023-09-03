import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/fetch_weather.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:weather_app/screens/HomeScreen.dart';
import 'package:http/http.dart' as http;
import "package:weather_app/models/Weather.dart";
import 'dart:convert';

import 'package:weather_app/widgets/header_widget.dart';
void main() {
  runApp(const MyApp());

  // String dt=DateTime.now().toString();
  // print(dt.substring(11,13));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalController globalController=Get.put(GlobalController(),permanent: true);
  String dt=DateTime.now().toString();
  Hourly? hourly;
  //String lat=globalController.getLatitude().value.toStringAsFixed(2);
  Future<Weather> getData() async{
    final response= await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude="+globalController.getLatitude().value.toStringAsFixed(2)+"&"+"longitude="+globalController.getLongitude().value.toStringAsFixed(2)+"&hourly=temperature_2m,relativehumidity_2m,precipitation_probability,cloudcover,windspeed_80m&forecast_days=1"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      //print(data);
      return Weather.fromJson(data);
      print("Success");
    }
    else{
      print("Fail");
      throw Exception('Failed to load album');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        
        title: Text("Weather App"),
      ),
      body: 
       Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            
            children: [
              Expanded(
                flex:1,
                child: Align
                
                (
                  alignment: Alignment.topLeft,
                  child: HeaderWidget()
                    ),
              ),
                
              Expanded(
                flex:3,
                child: FutureBuilder<Weather>(
                  future:getData() ,
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                    return Column(
                      children: [
                    
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            style: TextStyle(fontSize:35 ),
                            snapshot.data!.hourly!.temperature2m![int.parse(dt.substring(11,13))].toString()),
                        ),
                        Expanded(
                          flex:2,
                          child: ListView.builder(
                            //itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.hourly!.temperature2m!.length,
                            itemBuilder:(context,index){
                              return Container(
                                height: 180,
                                width: 140,
                                
                                child: Card(
                                  
                                  color: Colors.orangeAccent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:<Widget>[ 
                                      
                                      
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        style: TextStyle(fontSize: 17, color: const Color.fromARGB(255, 95, 122, 136)),
                                        snapshot.data!.hourly!.time![index].toString().substring(11)
                                      
                                      ),
                                    ),
                                    Icon(Icons.cloudy_snowing, color: Colors.white,size: 40,),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        
                                        style: TextStyle(fontSize: 17, color: Colors.white),
                                        snapshot.data!.hourly!.temperature2m![index].toString()+'°'),
                                    ),
                                    ]
                                  ),
                                ),
                              );
                          } ),
                        ),
                      ],
                    );
                    }
                    else{
                      return Text("Loading");
                    }
                  },
                ),
              ),
        
              Expanded(
                flex:4,
                child: Container())
            ],
          ),
        ),
      )
      
    );   
    
     
      
      
  }
  
}