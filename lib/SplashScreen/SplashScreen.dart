import 'dart:async';
import 'package:flutter/material.dart';
import '../onBoardingScreen/OnBorardainScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {super.initState();Timer(Duration(seconds: 7), () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>Onborardainscreen()), (route) => false,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[300],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("""   This app provides you with all the stadiums 
   available to you along with their reservation,
                 dates, prices and parking""",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,),),
              SizedBox(height: 30,),
              Icon(Icons.sports_soccer
              ,size: 150,
              color: Colors.white,),
              SizedBox(height: 30,),
              CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
      
      
      
        ),
      ),
    );
  }
}
