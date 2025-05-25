import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class BordingScreen2 extends StatefulWidget {
  const BordingScreen2({super.key});

  @override
  State<BordingScreen2> createState() => _BordingScreen2State();
}

class _BordingScreen2State extends State<BordingScreen2> {
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
              height: 120,
            ),
            Container(
              width: 300,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Lottie.network(
                  "https://lottie.host/d863445f-c75c-448c-9a08-f6463c940d31/Ghr9wsp9Yx.json",
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 100),
              child: Center(
                child: Container(
                  width: 340,
                  height: 170,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.red.shade400, width: 4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        "Make new friends \n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      Text(
                        "meet new friends",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      Text(
                        "gain communication skills",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      Text(
                        "play with professionals ",
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
