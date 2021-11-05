import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inaugurate extends StatefulWidget {
  final int index;
  const Inaugurate({Key? key, required this.index}) : super(key: key);

  @override
  _InaugurateState createState() => _InaugurateState();
}

class _InaugurateState extends State<Inaugurate> {

  late int index;
  late bool menu;
  List<String>? displayPic = [
    'images/deepak.jpeg',
    'images/suresh.jpg',
    'images/rajashree.jpg',
    'images/vijayalatha.jpg'
  ];

  List<String> names = [
    'Dr. Deepak Mathur',
    'Dr. K.R. Suresh Nair',
    'Dr. Rajashree Jain',
    'Dr. Vijayalatha Reddy',
  ];

  List<String> designation =[
    'Director, IEEE R10',
    'Chair, IEEE India Council',
    'Secretary, IEEE India Council',
    'Vice Chair, IEEE India Council',
  ];

  @override
  void initState() {
    super.initState();
    index=widget.index;
    setState(() {
      menu=false;
    });
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
              Container(
                width: 3*MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.height,
                child: rightSide(),
              )
            ],
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
                    //margin: const EdgeInsets.only(top: 50),
                    padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 100),
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: listWidget(),
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
            Text(names[index],style: GoogleFonts.andada(fontSize: 20),),
            const SizedBox(height: 5,),
            Text(designation[index],style: GoogleFonts.andada(fontSize: 15,color: Colors.white54),)
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
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 50,top: 20),
          height: 4*MediaQuery.of(context).size.height/5,
          child: Image.asset('images/nilavilakku.png'),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/fire.gif"),
              MaterialButton(
                onPressed: (){},
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
            const SizedBox(height: 10,),
            Text(names[id],style: GoogleFonts.andada(fontSize: 20),),
            const SizedBox(height: 5,),
            Text(designation[id],style: GoogleFonts.andada(fontSize: 15,color: Colors.white54),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }


}
