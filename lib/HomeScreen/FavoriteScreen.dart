import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites;

  FavoritesPage({required this.favorites});

  final Color backgroundColor = Color(0xFF030E2F);
  final Color accentColor = Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? Center(
        child: Text(
          'Your favorites list is empty!',
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: favorites.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            color: backgroundColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: accentColor.withOpacity(0.5),width: 3),
            ),
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 12),
              title: Text(
                favorites[index]['text'],
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(
                Icons.favorite,
                color: accentColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
