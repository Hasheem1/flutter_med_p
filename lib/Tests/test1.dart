import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_med_p/BottomNavigetionBar/gitInfoFromFire.dart';
class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:   Color(0xFF030E2F),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
            
                  SizedBox(height: 20,),
                  GetUserName(FirebaseAuth.instance.currentUser!.uid)
            
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
