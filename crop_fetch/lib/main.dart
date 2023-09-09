import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
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
      theme: ThemeData( colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  var pred_value="";
 Future<void> predData() async {
  final interpreter = await Interpreter.fromAsset('assets/model.tflite');
  var input = [
    [25, 35, 20, 28.90245, 43.3536, 8.92309, 71.900]
  ];

  var output = List.filled(1 * 22, 0).reshape([1, 22]);

  interpreter.run(input, output);

  // Find the index of the predicted class with the highest score
  //final int predictedClass = output[0].toList().indexOf(output[0].reduce((a, b) => a > b ? a : b));

  // Assuming cropLabels is a list of your crop labels
  //final List<String> cropLabels = ["Crop1", "Crop2", "Crop3", "..."]; // Replace with your actual labels

  // Update the state with the predicted crop label
  this.setState(() {
    pred_value = output[0].toString();
  });
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              pred_value,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(onPressed: predData, child:const Text('Press me'))
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
