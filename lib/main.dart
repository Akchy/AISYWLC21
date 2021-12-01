import 'dart:io';
import 'package:flutter/material.dart';
import 'inaugurate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AISYWLC'21 Inauguration",
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: const Inaugurate(index: 0),
    );
  }
}