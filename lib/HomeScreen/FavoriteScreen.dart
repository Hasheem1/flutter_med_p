import 'package:flutter/material.dart';

import '../Customizedwidget/HomeContainer.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Map<String, dynamic>> favoriteContainer = [];

  void toggleFavorite(bool isFavorite, String networkImage, String text, Widget targetScreen) {
    setState(() {
      if (isFavorite) {
        favoriteContainer.add({
          "networkImage": networkImage,
          "text": text,
          "targetScreen": targetScreen,
        });
      } else {
        favoriteContainer.removeWhere((element) => element["text"] == text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF030E2F),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10),
          Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: favoriteContainer.length,
              itemBuilder: (context, index) {
                return HomeContainer(
                  networkImage: favoriteContainer[index]["networkImage"]!,
                  text: favoriteContainer[index]["text"]!,
                  targetScreen: favoriteContainer[index]["targetScreen"]!,
                  onFavoriteChanged: (isFav) => toggleFavorite(
                    isFav,
                    favoriteContainer[index]["networkImage"]!,
                    favoriteContainer[index]["text"]!,
                    favoriteContainer[index]["targetScreen"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

