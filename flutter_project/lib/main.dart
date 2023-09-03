import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_project/home.dart';
import 'package:flutter_project/library.dart';
import 'package:flutter_project/search.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark, 
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
 
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
  int _currentIndex=0;

  final List<Widget> _body=[
    const HomeScreen(), const SearchScreen(), const LibraryScreen()
  ];
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        items:[ BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.library_books_outlined), label: 'Library')]),
      
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
