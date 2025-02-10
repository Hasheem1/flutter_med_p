import 'package:flutter/material.dart';
import 'Customizedwidget/logintxtform.dart';
import 'HomeScreen.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://c0.wallpaperflare.com/preview/244/499/764/green-sports-court-illustration.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 0),
                    Text(
                      "Sign Up  ",
                      style: TextStyle(color: Colors.orange, fontSize: 40),
                    ),
                    SizedBox(height: 30),
                    LoginTxtForm(
                      controller: _emailController,
                      hint: "example@domain.com",
                      lbl: "Email or Mobile ",
                      preIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      v: (value) {
                        if (!emailValidation(value!)) {
                          return "Not valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),
                    LoginTxtForm(
                      controller: _passwordController,
                      hint: "******",
                      lbl: "Password",

                      v: (value) {
                        if (!passValidation(value!)) {
                          return "Password must contain at least 8 characters, including a number, an uppercase letter, and a special character.";
                        }
                        return null;
                      },
                      preIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                    LoginTxtForm(
                      controller: _confirmPasswordController,
                      hint: "******",
                      lbl: "Confirm Password",

                      v: (value) {
                        if (!passValidation(value!)) {
                          return "Password must contain at least 8 characters, including a number, an uppercase letter, and a special character.";
                        }
                        if (_confirmPasswordController.text != _passwordController.text) {

                          return "Passwords do not match.";
                          
                        }
                        return null;
                      },
                      preIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 15, bottom: 15),
                      ),
                      onPressed: () {
                        print("${_passwordController.text}");
                        print("${_confirmPasswordController.text}");
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => Homescreen()),
                          );
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool emailValidation(String email) {
  String pattern =
      r"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$";
  return RegExp(pattern).hasMatch(email);
}

bool passValidation(String password) {
  String pattern =
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$';
  return RegExp(pattern).hasMatch(password);
}
