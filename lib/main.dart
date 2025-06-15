import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_med_p/BottomNavigetionBar/bottomTest.dart';
import 'package:flutter_med_p/Customizedwidget/UsersData.dart';
import 'package:flutter_med_p/Data/displayData.dart';
import 'package:flutter_med_p/Reservations/Reservations.dart';
import 'package:flutter_med_p/settings/settings.dart';
import 'Admin/AdminPassword.dart';
import 'Admin/AdminProparties.dart';
import 'Admin/DataStore.dart';
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
import 'SignUp_LogIn/SignUp.dart';
import 'SignUp_LogIn/enterState.dart';
import 'SplashScreen/SplashScreen.dart';
import 'firebase_options.dart';
import 'onBoardingScreen/BoardingScreen1.dart';
import 'onBoardingScreen/BoardingScreen2.dart';
import 'onBoardingScreen/BoardingScreen3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'onBoardingScreen/OnBorardainScreen.dart';



Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser==null?Splashscreen() :Bottomtest(),

    );
  }
}
                                       