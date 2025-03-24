import 'package:flutter/material.dart';
import '../HomeScreen/FavoriteScreen.dart';
import '../HomeScreen/HashemDetails.dart';
import '../HomeScreen/YarmoukDetails.dart';
import '../HomeScreen/toledoDetails.dart';

class HomeContainer extends StatefulWidget {
  final String networkImage;
  final String text;
  final Widget targetScreen;
  final Function(bool) onFavoriteChanged;

  HomeContainer({
    required this.networkImage,
    required this.text,
    required this.targetScreen,
    required this.onFavoriteChanged,
  });

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: NetworkImage(widget.networkImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Color(0xFF94e3a8),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => widget.targetScreen));
                  },
                  child: Text("Details", style: TextStyle(fontSize: 20)),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                    widget.onFavoriteChanged(isFavorite);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

