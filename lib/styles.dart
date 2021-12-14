import 'package:flutter/material.dart';

const bubbleDiameter = 272;
const inputFillColor = Color(0xFFE8E8E8);
const inputTextColor = Color(0xFFA9A9A9);
const greenColor = Color(0xff53a99a);

const bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33,
      color: Color(0x3827ae96),
    )
  ],
);

const labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
  fontFamily: 'LeagueGothic',
  fontSize: 127,
  color: Colors.white,
);

const unitTextStyle = TextStyle(
  fontFamily: 'LeagueGothic',
  fontSize: 38,
  color: Color(0x80ffffff),
);

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(15.0)),
  borderSide: BorderSide.none,
);

const labelFormDecoration = InputDecoration(
    hintStyle: TextStyle(color: inputTextColor),
    border: inputBorder,
    icon: Icon(
      Icons.label,
      color: greenColor,
    ),
    hintText: 'Enter label',
    fillColor: inputFillColor,
    filled: true);

const weightFormDecoration = InputDecoration(
  hintStyle: TextStyle(color: inputTextColor),
  border: inputBorder,
  icon: Icon(
    Icons.fitness_center,
    color: greenColor,
  ),
  fillColor: inputFillColor,
  filled: true,
  hintText: 'Enter weight',
);

ButtonStyle doneButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  )),
  backgroundColor: MaterialStateProperty.all(greenColor),
);
