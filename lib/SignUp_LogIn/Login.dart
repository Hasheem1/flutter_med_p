import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../BottomNavigetionBar/bottomTest.dart';
import '../Customizedwidget/logintxtform.dart';
import '../Data/DataCollect.dart' as data;
import '../HomeScreen/HomeScreen.dart';
import 'SignUp.dart';

class Loginscreen extends StatefulWidget {
  final String name;
  final String age;
  final String position;
  final String rate;
  final String proOrNo;

  const Loginscreen({
    super.key,
    required this.name,
    required this.age,
    required this.position,
    required this.rate,
    required this.proOrNo,
  });

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Color(0xFF030E2F),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF030E2F),
          borderRadius: BorderRadius.circular(0),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Text(
                        "Let's Get Started",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    LoginTxtForm(
                      controller: _emailController,
                      hint: "example@domain.com",
                      lbl: "Email or Mobile",
                      preIcon: Icon(Icons.email, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    LoginTxtForm(
                      controller: _passwordController,
                      hint: "******",
                      lbl: "Password",
                      preIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 250),
                      child: Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(
                            horizontal: 170, vertical: 15),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool success = await Signin(
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login successful!"),
                                backgroundColor: Colors.green,
                              ),
                            );

                            await Future.delayed(Duration(seconds: 1));
                            checkUserAndNavigate(context, _emailController.text.trim());
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text(
                            "Don't Have an account?",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style:
                              TextStyle(color: Colors.orange, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 180),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> Signin(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = 'Login failed. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  Future<void> checkUserAndNavigate(BuildContext context, String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('userCollection')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        print("Email exists in userCollection");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Bottomtest(),
          ),
        );
      } else {
        print("Email not found, go to data collection");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => data.UserInfo(
              name: widget.name,
              proOrNo: widget.proOrNo,
              rate: widget.rate,
              position: widget.position,
              age: widget.age,
            ),
          ),
        );
      }
    } catch (e) {
      print("Error checking user existence: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error checking user data.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
