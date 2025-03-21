import 'package:flutter/material.dart';

class Favoritescreen extends StatefulWidget {
  const Favoritescreen({super.key});

  @override
  State<Favoritescreen> createState() => _FavoritescreenState();
}

class _FavoritescreenState extends State<Favoritescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      body: SafeArea(child: Container(width: double.infinity,height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10,),
            Text("Favorite",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white), ),



          ],
        ),
      )
      ),
    );
  }
}
