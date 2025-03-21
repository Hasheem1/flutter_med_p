import 'package:flutter/material.dart';
import 'package:flutter_med_p/HomeScreen/HomeScreen.dart';

import '../BottomNavigetionBar/BottomNavigetionBar.dart';
import '../SignUp_LogIn/Login.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>SnakeNavigationBarExampleScreen()
                        ),
                      );
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
}
