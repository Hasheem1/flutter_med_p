import 'package:flutter/material.dart';
import 'package:flutter_med_p/Customizedwidget/UsersData.dart';
import 'Admin/AdminPassword.dart';
import 'Admin/AdminProparties.dart';
import 'BottomNavigetionBar/BottomNavigetionBar.dart';
import 'Customizedwidget/imageSlider.dart';
import 'Customizedwidget/logintxtform.dart';
import 'HomeScreen/FavoriteScreen.dart';
import 'HomeScreen/HashemDetails.dart';
import 'HomeScreen/HomeScreen.dart';
import 'HomeScreen/YarmoukDetails.dart';
import 'HomeScreen/toledoDetails.dart';
import 'ShowDialog/AddStadium.dart';
import 'SignUp_LogIn/Login.dart';
import 'SignUp_LogIn/enterState.dart';
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
      home: SnakeNavigationBarExampleScreen(),
    );
  }
}
