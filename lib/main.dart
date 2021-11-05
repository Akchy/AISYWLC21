import 'package:aisywlc21/home.dart';
import 'package:flutter/material.dart';

import 'inaugurate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AISYWLC'21 Inauguration",
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}