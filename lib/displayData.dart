import 'package:flutter/material.dart';
import 'package:flutter_med_p/userInfo.dart';

import 'Customizedwidget/UsersData.dart';
import 'HomeScreen.dart';
import 'Loginscreen.dart';
class DisplayData extends StatelessWidget {

  final Data data;

  const DisplayData(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://c0.wallpaperflare.com/preview/244/499/764/green-sports-court-illustration.jpg"),
    fit: BoxFit.fill )
      ),width: double.infinity,height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
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
                  padding: const EdgeInsets.only(left: 8,top: 130,bottom: 25),
                  child: Container(width:400,decoration: BoxDecoration(color:Colors.orangeAccent,border: Border.all(color: Colors.black,width: 3
                  ),
                  ),
                  child: Center(
                    child: Text("Name:${data.name}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
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
                      child: Text("Age:${data.age}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
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
                      child: Text("Position:${data.playerPosition}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
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
                      child: Text("rating:${data.playerRate}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
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
                      child: Text("player status :${data.inTeam}",style: TextStyle(color: Colors.white,backgroundColor: Colors.orangeAccent,fontSize: 30,
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
      
      


    );

  }
}