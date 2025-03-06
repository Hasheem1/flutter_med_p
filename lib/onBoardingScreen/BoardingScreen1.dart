import 'package:flutter/material.dart';
class BordingScreen1 extends StatefulWidget {
  const BordingScreen1({super.key});

  @override
  State<BordingScreen1> createState() => _BordingScreen1State();
}

class _BordingScreen1State extends State<BordingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Container(height: double.infinity,width: double.infinity,decoration: BoxDecoration(image: DecorationImage(image:NetworkImage('https://m.media-amazon.com/images/I/71IESmbz42L._AC_SY879_.jpg'), fit: BoxFit.cover,)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [SizedBox(height: 120,),

              Text("You Love Football Very Much?",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

              // Text("you don't have team to play football with ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      ),
    );
  }
}
