import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_med_p/BottomNavigetionBar/bottomTest.dart';
import 'package:flutter_med_p/Customizedwidget/UsersData.dart';
import 'package:flutter_med_p/HomeScreen/HomeScreen.dart';
import '../BottomNavigetionBar/BottomNavigetionBar.dart';
import '../BottomNavigetionBar/gitInfoFromFire.dart';
import '../SignUp_LogIn/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Tests/test1.dart';

class UserInfo extends StatefulWidget {
  final String name;
  final String age;
  final String position;
  final String rate;
  final String proOrNo;
  const UserInfo({
    super.key,
    required this.name,
    required this.age,
    required this.position,
    required this.rate,
    required this.proOrNo,
  });


  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF030E2F),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 58),
                Center(
                  child: Text(
                    "Before we start",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                  ),
                ),
                SizedBox(height: 13),
                Center(
                  child: Text(
                    "Fill these fields please",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                  ),
                ),
                SizedBox(height: 40),
                _buildTextField(_controller1, "Enter your name"),
                SizedBox(height: 30),
                _buildTextField(_controller2, "Enter your age"),
                SizedBox(height: 30),
                _buildTextField(_controller3, "Enter your position"),
                SizedBox(height: 30),
                _buildTextField(_controller4, "Rate yourself in football 1-10"),
                SizedBox(height: 30),
                _buildTextField(
                    _controller5, "Pro or beginner football player"),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    print("ffffffffff");

                    String name = _controller1.text;
                    String age = _controller2.text;
                    String position = _controller3.text;
                    String rate = _controller4.text;
                    String proOrNo = _controller5.text;

                    if (name.isNotEmpty &&
                        age.isNotEmpty &&
                        position.isNotEmpty &&
                        rate.isNotEmpty &&
                        proOrNo.isNotEmpty) {
                      addUser(name, age, position, rate, proOrNo);
Navigator.push(context, MaterialPageRoute(builder: (context) => Bottomtest(),));

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return SizedBox(
      width: 320,
      child: TextField(
        controller: controller,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(width: 3)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Color(0xFF94e3a8))),
          label: Text(
            label,
            style: TextStyle(color: Color(0xFF94e3a8), fontSize: 20),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF94e3a8)),
              borderRadius: BorderRadius.circular(30)),
        ),
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }


  addUser(String name, String age, String position, String rate, String state) {
    FirebaseFirestore userInstance = FirebaseFirestore.instance;
    CollectionReference users = userInstance.collection('userCollection');
    users.doc(FirebaseAuth.instance.currentUser!.uid).set(
        {
          'name': name,
          'age': age,
          'position': position,
          'Rate': rate,
          'State': state,
        }
    );
  }

}