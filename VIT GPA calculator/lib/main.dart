import 'package:bakchodi/dropdown.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
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
  List<Course> courses = [Course()];
  double GPA = 0;
  void AddCourse() {
    setState(() {
      courses.add(Course());
    });
  }

  void calcGPA() {
    double sum = 0, credSum = 0;
    for (Course course in courses) {
      sum += (course.credit * course.grade);
      print(course.grade.toString() + " " + course.credit.toString());
      credSum += course.credit;
    }
    setState(() {
      GPA = sum / credSum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('GPA Calculator'),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return dropdownButton(
                  course: courses[index],
                  onCreditChanged: (value) {
                    setState(() {
                      courses[index].credit = value;
                    });
                  },
                  onGradeChanged: (value) {
                    setState(() {
                      courses[index].grade = value;
                    });
                  },
                );
              },
              itemCount: courses.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: AddCourse, child: const Icon(Icons.add)),
              Text(GPA.toString()),
              ElevatedButton(onPressed: calcGPA, child: const Text("CGPA"))
            ],
          )
        ],
      )),
    );
  }
}
