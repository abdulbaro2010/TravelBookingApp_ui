import 'package:flutter/material.dart';
import 'package:travel_ui/screens/SearchScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel Booking UI',
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}
