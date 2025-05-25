import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';

class BordingScreen1 extends StatefulWidget {
  const BordingScreen1({super.key});

  @override
  State<BordingScreen1> createState() => _BordingScreen1State();
}

class _BordingScreen1State extends State<BordingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              SizedBox(
                width: 300,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Lottie.network(
                    "https://lottie.host/d2c4ea74-68ae-4193-8a36-7304eb43dee0/4qczl9OLUn.json",
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
                    height: 180,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.yellow.shade400, width: 4),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          "Football has become easy\n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        Text(
                          "if you don't have friend  ",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        Text(
                          "this app provide you with ",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        Text(
                          "all the available and nearby stadiums",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                        Text(
                          "ready to book and play. ",
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
      ),
    );
  }
}
// كيف اعمل PORDER RADIUS  لل اللوتي
