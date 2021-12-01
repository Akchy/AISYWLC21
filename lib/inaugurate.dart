import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_core/firebase_core.dart';
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
  late bool menu;
  var count;
  late bool one=false, two=false,three=false, four=false, five=false;
  late bool six=false, seven=false,eight=false,nine=false;
  late bool once =true;

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
  late CollectionReference reference;
  late StreamSubscription<QuerySnapshot> streamSub;
  //AudioPlayer audioPlayer = AudioPlayer();


  var player = AudioPlayer();

  void audioLoading()async{

    var duration = await player.setAsset('assets/audio/claps.mp3');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioLoading();

    Firebase.initializeApp();

    firestoreDB();


    index=widget.index;
    setState(() {
      menu=false;
    });

  }

  void firestoreDB(){
    reference = firestore.collection('diya');
    streamSub = reference.snapshots().listen((querySnapshot) async {
      for (var change in querySnapshot.docChanges) {

        count = change.doc.get('count');
        if(count>0){
          player.play();//audioPlayer.play('assets/audio/claps.mp3', isLocal: true,);
        }
        setState(() {
          switch(count){
            case 0: one=two=three=four=five=six=seven=eight=false; break;
            case 1: one=true;break;
            case 2: two=one=true;break;
            case 3: three=two=one=true;break;
            case 4: four=three=two=one=true;break;
            case 5: five=four=three=two=one=true;break;
            case 6: six=five=four=three=two=one=true;break;
            case 7: seven=six=five=four=three=two=one=true;break;
            case 8: eight=seven=six=five=four=three=two=one=true;break;
            case 9: nine=eight=seven=six=five=four=three=two=one=true;break;
          }
        });
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamSub.cancel();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
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
          ),

          if(once)Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 100),
                    color: Colors.black,
                    child:Text('Welcome To AISYWLC21 Inauguration',
                    style: GoogleFonts.andada(fontSize: 25,fontStyle: FontStyle.italic),),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:20),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          once=!once;
                        });
                      },
                      child: const Icon(Icons.clear,size: 25,),
                    ),
                  )
                ],
              ),
            ),
          ),
          menu?Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.6),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 100),
                    color: Colors.black,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: listWidget(),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:20),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          menu=!menu;
                        });
                      },
                      child: const Icon(Icons.clear,size: 25,),
                    ),
                  )
                ],
              ),
            ),
          ):const SizedBox(height: 1,)
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
            Text(names[index],style: GoogleFonts.andada(fontSize: 20), textAlign: TextAlign.center,),
            const SizedBox(height: 5,),
            Text(designation[index],style: GoogleFonts.andada(fontSize: 15,color: Colors.white54),textAlign: TextAlign.center)
          ],
        ),

        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: (){
              setState(() {
                menu=!menu;
              });
            },
            child: const Icon(Icons.account_circle,size: 40,),
          ),
        )

      ],
    );
  }

  Widget rightSide(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 50,top: 20),
          height: 4*MediaQuery.of(context).size.height/5,
          child: Stack(
            children: [
              Image.asset('assets/images/plane.png'),
              one? const DelayedDisplay(
                delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                child: Image(image: AssetImage('assets/images/lights/1.gif'))
              ):const SizedBox(),
              two? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/2.gif'))
              ):const SizedBox(),
              three? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/3.gif'))
              ):const SizedBox(),
              four? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/4.gif'))
              ):const SizedBox(),
              five? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/5.gif'))
              ):const SizedBox(),
              six? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/6.gif'))
              ):const SizedBox(),
              seven? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/7.gif'))
              ):const SizedBox(),
              eight? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/8.gif'))
              ):const SizedBox(),
              nine? const DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 0.1),
                  child: Image(image: AssetImage('assets/images/lights/9.gif'))
              ):const SizedBox(),


            ],
          ),
        ),

        /*SizedBox(
          child: MaterialButton(
            onPressed: (){
              var washingtonRef = firestore.collection('diya').doc('IfKwGg9LbZLRlj6ThXfi');
              washingtonRef.update({
                "count": 0
              });
            },
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('Reset',style: GoogleFonts.andada(fontSize: 20,color: Colors.black),),
            ),
          ),
        )*/
      ],
    );
  }

  List<Widget> listWidget(){
    List<Widget> rows=[];

    for(var temp in names) {
      rows.add(listNames(names.indexOf(temp)));
    }

    return rows;
  }

  Widget listNames(id){
    return InkWell(
      onTap: (){
        setState(() {
          index=id;
          menu=false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8,),
            Text(names[id],style: GoogleFonts.andada(fontSize: 16),),
            const SizedBox(height: 5,),
            Text(designation[id],style: GoogleFonts.andada(fontSize: 14,color: Colors.white54),),
            const SizedBox(height: 8,),
          ],
        ),
      ),
    );
  }


}
