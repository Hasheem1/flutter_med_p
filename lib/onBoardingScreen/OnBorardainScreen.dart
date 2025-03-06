import 'package:flutter/material.dart';
import 'package:flutter_med_p/SignUp_LogIn/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../HomeScreen/HomeScreen.dart';
import 'BoardingScreen1.dart';
import 'BoardingScreen2.dart';
import 'BoardingScreen3.dart';

class Onborardainscreen extends StatefulWidget {
  const Onborardainscreen({super.key});

  @override
  State<Onborardainscreen> createState() => _OnborardainscreenState();
}

class _OnborardainscreenState extends State<Onborardainscreen> {

  PageController _controller=PageController();
  bool islastpage=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:   Stack(
      children:[
        PageView(onPageChanged: (index) => {
          setState(() {   islastpage=(index==2);

          })


        },
        controller: _controller,

        children: [
          BordingScreen1(),
          BordingScreen2(),
          BordingScreen3(),


        ],
      ),
      Container(alignment: Alignment(0, 0.9),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SmoothPageIndicator(controller:_controller ,count:3 ,),
            ),

            GestureDetector(child: Padding(
              padding: const EdgeInsets.only(left: 138,),
              child: Icon(Icons.arrow_back,color: Colors.white,size: 50,),
            ),onTap:(){
              _controller.previousPage(duration: Duration(microseconds: 300), curve: Curves.bounceIn);
            } ,),


            islastpage?

            GestureDetector(child: Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),height: 40,width: 130,
                  child: Center(child: Text("Get Started ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),))),
            ),onTap:(){
              _controller.nextPage(duration:Duration(microseconds: 300) ,curve:Curves.bounceIn );
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Loginscreen(name: "name", age: "age", position: "position", rate: "rate", proOrNo: "proOrNo")), (route)=>false);},)
                :
            GestureDetector(child: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Icon(Icons.arrow_forward,color: Colors.white,size: 50,),
            ),onTap:(){
    _controller.nextPage(duration:Duration(microseconds: 300) ,curve:Curves.bounceIn );},)

          ],
        ),
      )]
          
    )
        );
  }
}
