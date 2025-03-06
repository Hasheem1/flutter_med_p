import 'package:flutter/material.dart';
import 'Customizedwidget/logintxtform.dart';
import 'SignUp_LogIn/Login.dart';
import 'SplashScreen/SplashScreen.dart';
import 'onBoardingScreen/BoardingScreen1.dart';
import 'onBoardingScreen/BoardingScreen2.dart';
import 'onBoardingScreen/BoardingScreen3.dart';
import 'onBoardingScreen/OnBorardainScreen.dart';

void main (){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onborardainscreen(),
    );
  }
}
