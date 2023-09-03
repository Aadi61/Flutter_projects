import 'package:bytelife/widgets/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
  //GoogleFonts.config.allowRuntimeFetching=false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFFAAA48),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
        
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(

            
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //const SizedBox(height: 10,),
              Text(
                'Good Evening',
                
                style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 30,),
              LoginWidget()
            ],
          ),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
