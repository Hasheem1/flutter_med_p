import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../onBoardingScreen/OnBorardainScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  int seconds = 5;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Onborardainscreen()),
              (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Lottie.network(
                "https://lottie.host/274dc387-4fc6-4e58-a680-07a390f74d6e/PiSNOEkrF3.json",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color(
                       ['**'],
                      value: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
            Text(
              "Play Football Jo",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 50),
            Text(
              "Wait For $seconds Second${seconds == 1 ? '' : 's'}...",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CircularProgressIndicator(
                strokeWidth: 10,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// كيف اغير لون اللوتي واغير حجمها