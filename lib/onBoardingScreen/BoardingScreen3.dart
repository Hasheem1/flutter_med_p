import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class BordingScreen3 extends StatefulWidget {
  const BordingScreen3({super.key});

  @override
  State<BordingScreen3> createState() => _BordingScreen3State();
}

class _BordingScreen3State extends State<BordingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 330,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Lottie.network(
                  "https://lottie.host/7070df22-c154-4e39-9cf8-6c30642bd80a/tXz1GOPaet.json",
                  height: 200,
                  width: 500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 100),
              child: Center(
                child: Container(

                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.orange, width: 4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        "overview benefits\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        "You can play anytime you want",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        "Encouraging sports",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        "this app will facilitate playing this game ",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        "Improving young people in ",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        " playing football ",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
