import 'package:flutter/material.dart';
import 'Customizedwidget/UsersData.dart';
import 'Loginscreen.dart';
import 'displayData.dart';

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
  final List<Map<String, String>> stadiums = [
    {
      "name": "Hashem Stadiums",
      "image": "https://media.istockphoto.com/id/1440483244/photo/soccer-stadium-ball-center-midfield.jpg?s=612x612&w=0&k=20&c=oxcLffTMo4KRVq5kCtBXbLRZTPwn7RRxcKlYgIooU_U="
    },
    {
      "name": "Yaman Stadiums",
      "image": "https://cdn.sourceflow.co.uk/woydyrnv5b2v444kq6c1gy8k57jg"
    },
    {
      "name": "Hamzeh Stadiums",
      "image": "https://images.unsplash.com/photo-1486286701208-1d58e9338013?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGZvb3RiYWxsJTIwd2FsbHBhcGVyfGVufDB8fDB8fHww"
    },
    {
      "name": "Ali Stadiums",
      "image": "https://t4.ftcdn.net/jpg/00/97/44/57/360_F_97445702_faYBL0ObQgGxnUOahUiIzY1w2mnJ2g4Y.jpg"
    },
    {
      "name": "Omar Stadiums",
      "image": "https://www.shutterstock.com/shutterstock/videos/3515853341/thumb/1.jpg?ip=x480"
    },
    {
      "name": "Mohammed Stadiums",
      "image": "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vdGJhbGwlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww"
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://c0.wallpaperflare.com/preview/244/499/764/green-sports-court-illustration.jpg",
                ),
                fit: BoxFit.cover,
                opacity: 0.7
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: SizedBox(
                  height: 350, // Allows only 3 items to be visible at a time
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: stadiums.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      stadiums[index]["image"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                stadiums[index]["name"]!,
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showSnackBar(context);
                              },
                              child: const Text("BOOK"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DisplayData(Data(widget.name, widget.age, widget.position, widget.rate, widget.proOrNo)),
                          ),
                        );
                      },
                      icon: Icon(Icons.account_circle, size: 40, color: Colors.white,),hoverColor: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>  Homescreen(name: "", age: "", position: "", rate: "", proOrNo: "")),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      hoverColor: Colors.orange,
                      icon: const Icon(Icons.home),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>  Homescreen(name: "", age: "", position: "", rate: "", proOrNo: "")),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      hoverColor: Colors.orange,
                      icon: const Icon(Icons.favorite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => Loginscreen(age:"" ,name: "",position: "",proOrNo: "",rate: "", )),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      hoverColor: Colors.orange,
                      icon: const Icon(Icons.logout),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 25, bottom: 20),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.orange[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 75, bottom: 20),
                    child: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.orange[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 70, bottom: 20),
                    child: Text(
                      "Favorite",
                      style: TextStyle(
                        color: Colors.orange[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,left: 50),
                    child: Text(
                      "Log Out",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange[200],),
                    ),
                  ),
                  SizedBox(height: 20),



                ],
              ),
            ],
          ),
        ],
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
