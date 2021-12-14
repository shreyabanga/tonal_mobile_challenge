import 'package:flutter/material.dart';
import '../widgets/metrics.dart';
import '../widgets/metrics_form.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  String label = "Upper Body";
  int weight = 45;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Metrics("Upper Body", 45),
            const SizedBox(height:20.0),
            const MetricsForm()

            // Metrics("Coe", 123),
            // Metrics("Lower Body", 315)
          ],
        ),
      ),
    );
  }
}
