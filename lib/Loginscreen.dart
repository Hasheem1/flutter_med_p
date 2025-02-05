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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://c0.wallpaperflare.com/preview/244/499/764/green-sports-court-illustration.jpg"),// Path to your image
            fit: BoxFit.fill,
            // Cover the entire screen
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
                    SizedBox(height: 25,),
                    Text("WELCOME TO", style: TextStyle(color: Colors.white,fontSize: 20)),
                    Text("PLAY FOOTBALL JO",style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(height: 50),

                    Text("Login ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 180),
                      child: Text("Lets Get Started ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white)),
                    ),
                    logintxtform(
                      controller: _emailController,
                      hint: "example@domain.com",
                      lbl: "Email or Mobile ",
                      preIcon:Icon(Icons.email,color: Colors.white,),
                      v: (value) {
                        if (!emailValidation(value!)) {
                          return "Not valid";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    logintxtform(
                      controller: _passwordController,
                      hint: "******",
                      lbl: "Password",
                      sufIcon: Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                      v: (value) {
                        if (!passValidation(value!)) {
                          return "Not valid";
                        }
                        return null;
                      },
                      preIcon: Icon(Icons.lock,color: Colors.white,),

                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Text("Forget password?",style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.only(left: 170, right: 170, top: 15, bottom: 15),
                      ),
                      onPressed: () {



                            if (_formKey.currentState!.validate()) {
                          setState(() {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => Homescreen()
                                ));
                          }
                          );



                        }
                      },
                      child: Text("Login ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        children: [
                          Text("Dont Have an account ? ",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white)),
                          TextButton(onPressed: (){
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Screen1()),
                            );
                          }, child: Text("Sign up",style: TextStyle(color: Colors.orange, fontSize: 20),)),

                          SizedBox(
                            height: 10,
                          )
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
