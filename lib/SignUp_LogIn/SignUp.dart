import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import '../Customizedwidget/logintxtform.dart';
import '../Data/DataCollect.dart';
import '../HomeScreen/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'Login.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(
      "Sign Up  ",
      style: TextStyle(color: Colors.orange, fontSize: 40),
    ),backgroundColor: Color(0xFF030E2F),iconTheme: IconThemeData( color: Colors.white,size: 30),),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF030E2F),
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
                    LoginTxtForm(
                      controller: _emailController,
                      hint: "example@domain.com",
                      lbl: "Email or Mobile ",
                      preIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),

                    ),
                    SizedBox(height: 30),
                    LoginTxtForm(
                      controller: _passwordController,
                      hint: "******",
                      lbl: "Password",

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
                        if (_formKey.currentState!.validate()) {
                          if (_passwordController.text != _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Passwords do not match.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          SignUp(_emailController.text, _passwordController.text);
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

                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("already hava an account ?",style: TextStyle(fontSize: 15,color: Colors.white),),

                            TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen(name: "name", age: "age", position: "position", rate: "rate", proOrNo: "proOrNo"),));                        },
                                          child: Text("Sign in",style: TextStyle(color:Colors.orange,fontWeight: FontWeight.bold ),))
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                              child: InkWell(onTap: (){
                                signInWithGoogle();
                              },
                                child: Lottie.network(
                                  "https://lottie.host/bb66f443-8c55-4889-adc3-c3d00eaebbce/hsnUu0MW4U.json",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future SignUp(String email, String pass) async {
    try {
      final credential = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // Navigate to HomeScreen after successful signup
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginscreen(name: "name", age: "age", position: "position", rate: "rate", proOrNo: "proOrNo")));

    } on auth.FirebaseAuthException catch (e) {
      String errorMsg = '';
      if (e.code == 'weak-password') {
        errorMsg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMsg = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        errorMsg = 'The email address is not valid.';
      } else {
        errorMsg = 'Something went wrong. Please try again.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred.'),
          backgroundColor: Colors.red,
        ),
      );
      print(e);
    }
  }
  Future<auth.UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.FirebaseAuth.instance.signInWithCredential(credential);


  }


}

