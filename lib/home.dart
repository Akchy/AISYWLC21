
import 'dart:async';

import 'package:aisywlc21/inaugurate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int dropdownValue = 0;
  List<String> names = [
    'Dr. K.R. Suresh Nair',
    'Mr. Deepak Mathur',
    'Ms. Sarada Jayakrishnan',
    'Dr. Thalappil Pradeep',
    'Dr. Prerna Gaur',
    'Dr. Rajashree Jain',
    'Prof. Shankar J',
    'Dr. Y. Vijayalatha'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("AISYWLC'21 Inauguration",
              style: GoogleFonts.andada(fontSize: 50.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Good evening ',style: GoogleFonts.lora(fontSize: 25),),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<int>(
                    value: dropdownValue,
                    dropdownColor: Colors.white,

                    borderRadius: BorderRadius.circular(8),
                    icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                    iconSize: 24,
                    elevation: 16,
                    style: GoogleFonts.lora(fontSize: 20),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    items: names.map<DropdownMenuItem<int>>((String value) {
                      return DropdownMenuItem<int>(
                        value: names.indexOf(value),
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Inaugurate(index: dropdownValue,)),);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                //onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Text("Let's Go",style: GoogleFonts.andada(fontSize: 20)),
              )),
          ],
        ),
      ),
    );
  }
}
