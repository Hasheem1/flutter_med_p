import 'package:flutter/material.dart';
import '../Customizedwidget/logintxtform.dart';
import '../Data/DataCollect.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  BoxDecoration(color: Color(0xFF030E2F),borderRadius: BorderRadius.circular(0),

        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding:  EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                     SizedBox(height: 50),
                     Text("Login",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                     SizedBox(height: 80),
                     Padding(
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
                      preIcon:  Icon(Icons.email, color: Colors.white),

                      v: (value) {
                        if (!emailValidation(value!)) {
                          return "Not valid";
                        }
                        return null;
                      },
                    ),
                     SizedBox(height: 20),
                    LoginTxtForm(
                      controller: _passwordController,
                      hint: "******",
                      lbl: "Password",
                      preIcon:  Icon(Icons.lock, color: Colors.white),

                      v: (value) {
                        if (!passValidation(value!)) {
                          return "Password is not valid";
                        }
                        return null;
                      },
                    ),
                     SizedBox(height: 5),
                     Padding(
                      padding: EdgeInsets.only(left: 250),
                      child: Text("Forget password?",
                          style: TextStyle(color: Colors.white)),
                    ),
                     SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding:  EdgeInsets.symmetric(
                            horizontal: 170, vertical: 15),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => UserInfo()),
                          );
                        }
                      },
                      child:  Text("Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                     SizedBox(height: 20),
                    Padding(
                      padding:  EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                           Text("Don't Have an account?",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white)),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Screen1(name: "hashem",age:"20" ,position: "CM",proOrNo: "PRO",rate: "8.7",)),
                              );
                            },
                            child:  Text("Sign up",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 20)),
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
