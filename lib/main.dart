import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//create stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to first prog"),
          ),
        ),
      ),
    );
  }
}
