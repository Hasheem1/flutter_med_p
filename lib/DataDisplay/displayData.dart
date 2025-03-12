import 'package:flutter/material.dart';
import '../Customizedwidget/UsersData.dart';
import '../HomeScreen/HomeScreen.dart';
import '../SignUp_LogIn/Login.dart';

class DisplayData extends StatefulWidget {



  final Data data;

  const DisplayData(this.data);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(color: Color(0xFF030E2F),

      ),width: double.infinity,height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 65,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16,),
                    child: Container(width:300,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                    ),
                    ),
                      child: Center(
                        child: Text("your information",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 50,bottom: 25),
                    child: Container(width:400,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                    ),
                    ),
                      child: Center(
                        child: Text("Name:${widget.data.name}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
                        ),
                        ),
                      ),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16,bottom: 25),
                    child: Container(width:400,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                    ),
                    ),
                      child: Center(
                        child: Text("Age:${widget.data.age}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16,bottom: 25),
                    child: Container(width:400,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                    ),
                    ),
                      child: Center(
                        child: Text("Position:${widget.data.playerPosition}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16,bottom: 25),
                    child: Container(width:400,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                    ),
                    ),
                      child: Center(
                        child: Text("rating:${widget.data.playerRate}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8,top: 16,bottom: 25),
                    child: Container(width:400,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                    ),
                    ),
                      child: Center(
                        child: Text("player status :${widget.data.inTeam}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
                        ),
                        ),
                      ),
          
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      SizedBox(width: 170,),
          
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const Homescreen(name: "",age:"" ,position: "",proOrNo: "",rate: "",)),
                          );
                        },
                        color: Colors.white,
                        iconSize: 40,
                        hoverColor: Colors.orange,
                        icon: const Icon(Icons.home),
                      ),
                      SizedBox(width: 10,),
          
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => Loginscreen(rate: "",proOrNo: "",position: "",name: "",age: "",)),
                          );
                        },
                        color: Colors.white,
                        iconSize: 40,
                        hoverColor: Colors.orange,
                        icon: const Icon(Icons.logout_outlined),
                      ),
                    ],
                  ),
          
          
          
                ],
              ),
            ],
          ),
        ),
      ),
    ),




    );

  }
}