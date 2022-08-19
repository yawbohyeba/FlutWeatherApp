import 'package:flutter/material.dart';
import 'package:weatherapp/dashboard.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
