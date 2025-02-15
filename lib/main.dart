import 'package:flutter/material.dart';
import 'package:flutter_med_p/userInfo.dart';

import 'Customizedwidget/logintxtform.dart';
import 'HomeScreen.dart';
import 'Loginscreen.dart';
import 'displayData.dart';

void main (){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

   //   home: Homescreen(rate: "",proOrNo: "",position: "",name: "",age: "",) ,
home: UserInfo(),
    );
  }
}
