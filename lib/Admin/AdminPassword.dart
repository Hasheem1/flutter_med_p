import 'package:flutter/material.dart';
import 'package:flutter_med_p/Admin/AdminProparties.dart';
import 'package:lottie/lottie.dart';

import '../Customizedwidget/logintxtform.dart';
import '../SignUp_LogIn/Login.dart';

class Adminpassword extends StatefulWidget {
  const Adminpassword({super.key});

  @override
  State<Adminpassword> createState() => _AdminpasswordState();
}

class _AdminpasswordState extends State<Adminpassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Admin Password",style: TextStyle(color: Colors.white,fontSize: 30),),iconTheme: IconThemeData(size: 30,color: Colors.white),backgroundColor: Color(0xFF030E2F),),
      backgroundColor: Color(0xFF030E2F),
      body: Container(
        width: double.infinity,height: double.infinity,

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),


              Lottie.network("https://lottie.host/0ac644af-16af-4293-bf62-0ef3cf048e13/sWEnXywFIi.json"),


              TextFormField(style: TextStyle(color: Colors.white,fontSize: 30),
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "******",
                  label: Text(" Admin Password",style: TextStyle(color: Colors.white),),
                  prefixIcon:  Icon(Icons.lock, color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Color(0xFFf4bb8e) ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFf4bb8e), width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),

              ),


              SizedBox(height: 15,),
              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Adminproparties(),));},style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFFf4bb8e),
                )
                ), child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text("Enter",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25,
                ),
                ),
              )
              ,
              )

            ],
          ),
        ),

      ),
    );
  }
}
