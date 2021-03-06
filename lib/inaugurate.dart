import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class Inaugurate extends StatefulWidget {
  final int index;
  const Inaugurate({Key? key, required this.index}) : super(key: key);

  @override
  _InaugurateState createState() => _InaugurateState();
}

class _InaugurateState extends State<Inaugurate> {

  late int index;
  bool isButtonDisabled =false;

  List<String>? displayPic = [
    'assets/images/suresh.jpeg',
    'assets/images/deepak.jpeg',
    'assets/images/kasim.jpg',
    'assets/images/sarit.jpg',
    'assets/images/debabrata.jpg',
    'assets/images/rajashree.jpg',
    'assets/images/prerna.png',
    'assets/images/vijayalatha.jpg',
    'assets/images/sankar.jpeg',
  ];

  List<String> names = [
    'Dr. K.R. Suresh Nair',
    'Mr. Deepak Mathur',
    'Prof. Muhammed Kasim',
    'Dr. Sarit Kumar Das',
    'Dr. Debabrata Das',
    'Dr. Rajashree Jain',
    'Dr. Prerna Gaur',
    'Dr. Y. Vijayalata',
    'Prof. Shankar J',
  ];

  List<String> designation =[
    'Chair, IEEE India Council',
    'Director, IEEE Region 10',
    'Vice Chair, IEEE Kerala Section',
    'Institute Chair Professor, IIT Madras',
    'Chair-Elect, IEEE India Council 2021',
    'Secretary, IEEE India Council',
    'Treasurer, IEEE India Council',
    'Vice Chair, Student Activities, IEEE India Council',
    'Chair, Student Activities, IEEE Kerala Section',
  ];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var player = AudioPlayer();


  @override
  void initState() {
    super.initState();
    index=widget.index;
    audioLoading();
  }

  void audioLoading()async{

    var duration = await player.setAsset('assets/audio/claps.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.black87,
            padding: const EdgeInsets.only(top: 40,bottom: 40),
            width: MediaQuery.of(context).size.width/4,
            height: MediaQuery.of(context).size.height,
            child: leftSide(),
          ),
          SizedBox(
            width: 3*MediaQuery.of(context).size.width/4,
            height: MediaQuery.of(context).size.height,
            child: rightSide(),
          )
        ],
      )
    );
  }

  Widget leftSide(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
              ),
              child: ClipOval(child: Image.asset(displayPic![index],fit: BoxFit.fitWidth,)),
            ),
            const SizedBox(height: 15,),
            Text(names[index],style: GoogleFonts.andada(fontSize: 20),textAlign: TextAlign.center,),
            const SizedBox(height: 5,),
            Text(designation[index],style: GoogleFonts.andada(fontSize: 15,color: Colors.white54,),textAlign: TextAlign.center),
          ],
        ),
        isButtonDisabled?Container(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: DelayedDisplay(
            delay: const Duration(seconds: 1),
            child: Text('Thank you for Lighting the lamp',style: GoogleFonts.andada(fontSize: 25),textAlign: TextAlign.center,)
          ),
        ):const SizedBox(),
      ],
    );
  }

  Widget rightSide(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 50,top: 20),
          height: 4*MediaQuery.of(context).size.height/5,
          child: Stack(
            children: [
              const Image(image: AssetImage('assets/images/plane.png')),
              !isButtonDisabled?
                const SizedBox()
                  :const DelayedDisplay(
                    delay: Duration(seconds: 1),
                    slidingBeginOffset: Offset(0, 0.1),
                    child: Image(image:AssetImage('assets/images/one.gif'))
                  ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/fire.gif"),
              MaterialButton(
                onPressed: isButtonDisabled?null:(){
                  var washingtonRef = firestore.collection('diya').doc('IfKwGg9LbZLRlj6ThXfi');
                  washingtonRef.update({
                    "count": FieldValue.increment(1)
                  });
                  setState(() {
                    isButtonDisabled =true;
                  });

                  player.play();

                },
                disabledColor: Colors.white70,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('IGNIS',style: GoogleFonts.andada(fontSize: 20,color: Colors.black),),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}
