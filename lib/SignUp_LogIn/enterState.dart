import 'package:flutter/material.dart';
import 'package:flutter_med_p/SignUp_LogIn/Login.dart';
import 'package:flutter_med_p/SignUp_LogIn/SignUp.dart';
import 'package:lottie/lottie.dart';

import '../Admin/AdminPassword.dart';
import '../Admin/AdminProparties.dart';

class Enterstate extends StatefulWidget {
  @override
  State<Enterstate> createState() => _EnterstateState();
}

class _EnterstateState extends State<Enterstate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF030E2F),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.all(16.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:  EdgeInsets.all(0),
                    child: Container(
                      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(300),),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Lottie.network(
                              "https://lottie.host/093ad2ae-4c06-48f7-8858-42b7d5c76a39/I9XZlQw5iB.json",
                              height: 180,
                              width: 300,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Loginscreen(name: "name", age: "age", position: "position", rate: "rate", proOrNo: "proOrNo"),
                                ),
                              );
                            },
                          ),
                          Text("Login",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold ),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(3),
                    child: Container(

                      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(300),),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(child: Lottie.network("https://lottie.host/1252baef-ea8f-4354-8b80-002c36d5e7b7/C1yjarOFhw.json",height: 220,width: 500)
                          ,onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),
                            ),
                            );
                            },
                            ),
                          Text("Register",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold
                          ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(0),
                    child: Container(

                      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(300),),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(child: Lottie.network("https://lottie.host/8098b90a-a99a-4352-823e-3d43dee2369b/jVTMCci7uM.json",height: 180,width: 300)
                          ,onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>Adminpassword(),
                            ),
                            );
                            },),
                          Text("Admin",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
