import 'package:flutter/material.dart';
import 'pages/demo_page.dart';
import 'styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tonal Mobile Challenge',
      theme: ThemeData(
        fontFamily: 'Helvetica',
        primarySwatch: Colors.green,
      ),
      home: const DemoPage(),
    );
  }
}
