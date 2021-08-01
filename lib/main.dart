import 'package:flutter/material.dart';
import 'package:nitroplanter/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: MainMenu(),
    );
  }
}
