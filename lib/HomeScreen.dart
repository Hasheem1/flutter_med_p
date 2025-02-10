import 'package:flutter/material.dart';
import 'Loginscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

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
          // Background image container
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://c0.wallpaperflare.com/preview/244/499/764/green-sports-court-illustration.jpg",
                ),
                fit: BoxFit.cover,
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
                    padding: const EdgeInsets.only(left: 73),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => Loginscreen()),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      hoverColor: Colors.orange,
                      icon: const Icon(Icons.login_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 85),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const Homescreen()),
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
                              builder: (context) => const Homescreen()),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      hoverColor: Colors.orange,
                      icon: const Icon(Icons.favorite),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 82, bottom: 20),
                    child: Text(
                      "Log Out",
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
