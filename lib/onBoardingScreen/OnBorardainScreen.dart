import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../SignUp_LogIn/enterState.dart';
import 'BoardingScreen1.dart';
import 'BoardingScreen2.dart';
import 'BoardingScreen3.dart';

class Onborardainscreen extends StatefulWidget {


  @override
  State<Onborardainscreen> createState() => _OnborardainscreenState();
}

class _OnborardainscreenState extends State<Onborardainscreen> {
  PageController _controller = PageController();
  int currentIndex = 0;
  bool islastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                islastpage = (index == 2);
              });
            },
            children: [
              BordingScreen1(),
              BordingScreen2(),
              BordingScreen3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                  ),
                ),

                currentIndex >= 1
                    ? GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(left: 135),
                    child: Icon(Icons.arrow_back, color: Colors.white, size: 50),
                  ),
                  onTap: () {
                    _controller.previousPage(
                        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                )
                    : SizedBox(width: 50),

                islastpage
                    ? GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 40,
                      width: 130,
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Enterstate()),
                            (route) => false);
                  },
                )
                    : GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 50),
                  ),
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
