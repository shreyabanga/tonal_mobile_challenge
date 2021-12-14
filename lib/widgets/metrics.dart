import 'package:flutter/material.dart';
import '../styles.dart';

class Metrics extends StatelessWidget {
  Metrics(this.label, this.weight);

  final String label;
  final int weight;
  static String unit = "lbs";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bubbleDiameter.toDouble(),
      width: bubbleDiameter.toDouble(),
      decoration: bubbleBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text(
            label,
            style: labelTextStyle,),
          Text(
            weight.toString(),
            style: weightTextStyle,), 
          Text(
            unit,
            style: unitTextStyle,)
        ]
      ),
    );
  }
}
