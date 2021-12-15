import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../styles.dart';

class Metrics extends StatelessWidget {
  /* Reusable Metrics widget that accepts the label and weight and displays them */
  Metrics(this.label, this.weight);

  final String label;
  final int weight;
  static String unit = "lbs";
  static String assetName = 'assets/images/graph.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bubbleDiameter.toDouble(),
      width: bubbleDiameter.toDouble(),
      decoration: bubbleBoxDecoration,
      child: ClipRRect(
        /* I used ClipRRect and another container inside it to make sure the SVG
          image does not go out of bounds. Wrapping the above container with 
          ClipRRect disables shadows. 
        */

        borderRadius: BorderRadius.circular(bubbleDiameter / 2),
        child: Container(
          height: bubbleDiameter.toDouble(),
          width: bubbleDiameter.toDouble(),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            /* I used Positioned widgets inside the Stack because a Column 
              widget didnt give me the exact spacing i wanted between the 
              children. This makes my widget identical to the design team's. 

              This stack contains the picture, Label, Weight and Unit widgets.
            */
              alignment: Alignment.center,
              children: [
                graphWidget(),
                labelWidget(),
                weightWidget(),
                unitWidget(),
              ]),
        ),
      ),
    );
  }

  Positioned graphWidget() {
    return Positioned(
                top: 165,
                child: SvgPicture.asset(
                  assetName,
                  height: bubbleDiameter.toDouble()/2,
                  width: bubbleDiameter.toDouble()/2,
                ),
              );
  }

  Positioned labelWidget() {
    return Positioned(
                top: bubbleDiameter * 0.2,
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 24, maxWidth: 160),
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: labelTextStyle,
                  ),
                ),
              );
  }

  Positioned weightWidget() {
    return Positioned(
                bottom: bubbleDiameter * 0.2,
                // left:bubbleDiameter*0.45,
                child: Text(

                  /* I was not sure if the weight contraint of 0-350 needed to be cross-
                  checked, so i included a check here just to prevent text from overflowing.
                  This functionality can be included before passing in the number as well.
                  */
                  weight > 350
                      ? "350"
                      : (weight < 0 ? "0" : weight.toString()),
                  style: weightTextStyle,
                ),
              );
  }

  Positioned unitWidget() {
    return Positioned(
                bottom: bubbleDiameter * 0.1,
                // left:bubbleDiameter*0.45,
                child: Text(
                  unit,
                  style: unitTextStyle,
                ),
              );
  }
}
