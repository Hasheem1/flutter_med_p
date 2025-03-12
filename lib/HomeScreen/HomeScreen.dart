import 'package:flutter/material.dart';
import '../Customizedwidget/UsersData.dart';
import '../DataDisplay/displayData.dart';
import '../SignUp_LogIn/Login.dart';


class Homescreen extends StatefulWidget {
  final String name;
  final String age;
  final String position;
  final String rate;
  final String proOrNo;

  const Homescreen({
    super.key,
    required this.name,
    required this.age,
    required this.position,
    required this.rate,
    required this.proOrNo,
  });
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  bool FavIconpressd = false;
  Color IconColor = Colors.white;
/*
  final List<Map<String, String>> stadiums = [
    {
      "name": "yarmouk  ",
      "image": "https://media.istockphoto.com/id/1440483244/photo/soccer-stadium-ball-center-midfield.jpg?s=612x612&w=0&k=20&c=oxcLffTMo4KRVq5kCtBXbLRZTPwn7RRxcKlYgIooU_U="
    },
    {
      "name": "alattar",
      "image": "https://cdn.sourceflow.co.uk/woydyrnv5b2v444kq6c1gy8k57jg"
    },
    {
      "name": "hashem",
      "image": "https://images.unsplash.com/photo-1486286701208-1d58e9338013?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGZvb3RiYWxsJTIwd2FsbHBhcGVyfGVufDB8fDB8fHww"
    },
    {
      "name": "toledo",
      "image": "https://t4.ftcdn.net/jpg/00/97/44/57/360_F_97445702_faYBL0ObQgGxnUOahUiIzY1w2mnJ2g4Y.jpg"
    },
    {
      "name": "king abdullah",
      "image": "https://www.shutterstock.com/shutterstock/videos/3515853341/thumb/1.jpg?ip=x480"
    },
    {
      "name": "tabaria",
      "image": "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vdGJhbGwlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"
    },
  ];
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(
        decoration:  BoxDecoration(color: Color(0xFF030E2F),borderRadius: BorderRadius.circular(0),),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               SizedBox(height: 10,),
                Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white), ),

                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white)),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage("https://t4.ftcdn.net/jpg/00/97/44/57/360_F_97445702_faYBL0ObQgGxnUOahUiIzY1w2mnJ2g4Y.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text("yarmouk",
                          style:  TextStyle(
                            color: Color(0xFF94e3a8),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: [SizedBox(height:25 ,),
                          ElevatedButton(
                            onPressed: () {
                              showSnackBar(context);
                            },
                            child:  Text("Details" ,style: TextStyle(fontSize: 20),),
                          ),
                          IconButton(onPressed: () {
                            setState(() {
                              FavIconpressd = !FavIconpressd;
                              IconColor = FavIconpressd ? Colors.red : Colors.white;
                            });
                          }, icon: Icon(Icons.favorite, color: IconColor, size: 40))
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Align(alignment: Alignment.bottomCenter,
                    child: Container(width: double.infinity,height: 100,
                      alignment: Alignment.bottomCenter,decoration: BoxDecoration(color: Color(0xFF94e3a8),borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.only(bottom: 10), // Adds some space at the bottom
                       child: Expanded(
                        child: Align(alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Spreads the icons evenly
                            children: [
                          
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DisplayData(Data(widget.name, widget.age, widget.position, widget.rate, widget.proOrNo)),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.account_circle, size: 40, color: Colors.white),
                                    hoverColor: Colors.orange,
                                  ),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Homescreen(
                                              name: "hashem",
                                              age: "20",
                                              position: "CM",
                                              proOrNo: "PRO",
                                              rate: "8.7",
                                            )),
                                      );
                                    },
                                    color: Colors.white,
                                    iconSize: 40,
                                    hoverColor: Colors.orange,
                                    icon: const Icon(Icons.home),
                                  ),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Homescreen(
                                              name: widget.name,
                                              age: widget.age,
                                              position: widget.position,
                                              proOrNo: widget.proOrNo,
                                              rate: widget.rate,
                                            )),
                                      );
                                    },
                                    color: Colors.white,
                                    iconSize: 40,
                                    hoverColor: Colors.orange,
                                    icon: const Icon(Icons.favorite),
                                  ),
                                  Text(
                                    "Favorite",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Loginscreen(
                                              name: "hashem",
                                              age: "20",
                                              position: "CM",
                                              proOrNo: "PRO",
                                              rate: "8.7",
                                            )),
                                      );
                                    },
                                    color: Colors.white,
                                    iconSize: 40,
                                    hoverColor: Colors.orange,
                                    icon: const Icon(Icons.logout),
                                  ),
                                  Text(
                                    "Log Out",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

    );
  }
  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(backgroundColor: Colors.yellow[400],
      content: Center(
        child: Row(children:
        [SizedBox(width: 20,), Icon(Icons.check,color: Colors.green,size: 40,applyTextScaling: true,
        ),
          SizedBox(width: 120,),
          Text('Stadium booked',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold,backgroundColor: Colors.yellow[300],
          ),
          ),
        ],
        ),
      ),
      duration: Duration(seconds: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}
