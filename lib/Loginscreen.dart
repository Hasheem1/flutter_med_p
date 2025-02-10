import 'package:flutter/material.dart';
import 'package:flutter_med_p/SignUp.dart';
import 'Customizedwidget/logintxtform.dart';

import 'HomeScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://c0.wallpaperflare.com/preview/244/499/764/green-sports-court-illustration.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    const Text("WELCOME TO",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const Text("PLAY FOOTBALL JO",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 50),
                    const Text("Login",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Text("Let's Get Started",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white)),
                    ),
                    LoginTxtForm(
                      controller: _emailController,
                      hint: "example@domain.com",
                      lbl: "Email or Mobile",
                      preIcon: const Icon(Icons.email, color: Colors.white),

                      v: (value) {
                        if (!emailValidation(value!)) {
                          return "Not valid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    LoginTxtForm(
                      controller: _passwordController,
                      hint: "******",
                      lbl: "Password",
                      preIcon: const Icon(Icons.lock, color: Colors.white),

                      v: (value) {
                        if (!passValidation(value!)) {
                          return "Password is not valid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(left: 250),
                      child: Text("Forget password?",
                          style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 170, vertical: 15),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => Homescreen()),
                          );
                        }
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          const Text("Don't Have an account?",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Screen1()),
                              );
                            },
                            child: const Text("Sign up",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 180),
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
