import 'package:flutter/material.dart';
import '../widgets/metrics.dart';
import '../widgets/metrics_form.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  /* Initial values */
  String label = "Upper Body";
  int weight = 45;

  /* The function that is called from the child to receive the user entered 
    values.
  */
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Metrics(label, weight),
              const SizedBox(height: 20.0),
              MetricsForm(notifyParent: refresh)
            ],
          ),
        ),
      ),
    );
  }
}
