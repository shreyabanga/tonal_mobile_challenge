import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles.dart';

class Metrics extends StatelessWidget {
  Metrics(this.label, this.weight);

  final String label;
  final int weight;
  static String unit = "lbs";
  final String assetName = 'assets/images/graph.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bubbleDiameter.toDouble(),
      width: bubbleDiameter.toDouble(),
      decoration: bubbleBoxDecoration,
      child: Stack(
        alignment: Alignment.bottomCenter,
      children: [
        SvgPicture.asset(
          assetName,
          
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          Text(
            label,
            style: labelTextStyle,
          ),
          /* I was not sure if the weight contraint of 0-350 needed to be cross-
          checked, so i included a check here just to prevent text from overflowing.
          This functionality can be included before passing in the number as well.
          */
          Text(
            weight > 350 ? "350" : (weight < 0 ? "0" : weight.toString()),
            style: weightTextStyle,
          ),
          Text(
            unit,
            style: unitTextStyle,
          )
        ]),
      ]),
    );
  }
}
