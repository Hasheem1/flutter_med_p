import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'Loginscreen.dart';

void main (){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Loginscreen() ,

    );
  }
}
