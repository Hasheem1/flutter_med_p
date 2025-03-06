import 'package:flutter/material.dart';
class BordingScreen3 extends StatefulWidget {
  const BordingScreen3({super.key});

  @override
  State<BordingScreen3> createState() => _BordingScreen3State();
}

class _BordingScreen3State extends State<BordingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-1192763963.jpg?c=16x9&q=h_833,w_1480,c_fill"),fit: BoxFit.cover)),
        child: Container(height: double.infinity,width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 500,),

              Text("Welcome To Play Football Jo",style: TextStyle(color: Colors.white,fontSize: 30),)

            ],
          ),
        ),
      ),
    );
  }
}
