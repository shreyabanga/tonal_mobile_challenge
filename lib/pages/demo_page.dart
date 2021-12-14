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

  void refresh(values) {
    setState(() {
      weight = values['weight'];
      label = values['label'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tonal Coding Challenge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Metrics(label, weight),
            const SizedBox(height: 20.0),
            MetricsForm(notifyParent: refresh)

            // Metrics("Coe", 123),
            // Metrics("Lower Body", 315)
          ],
        ),
      ),
    );
  }
}
