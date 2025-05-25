import 'package:flutter/material.dart';
import '../Customizedwidget/UsersData.dart';

class DisplayData extends StatefulWidget {
  final Data data;

  const DisplayData(this.data, {Key? key}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  final Color backgroundColor = Color(0xFF030E2F);
  final Color accentColor = Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  Widget buildInfoTile(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: accentColor, width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label:",
              style: TextStyle(
                color: accentColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Your Information",
                style: TextStyle(
                  color: accentColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 40),
              buildInfoTile("Name", widget.data.name.toString()),
              buildInfoTile("Age", widget.data.age.toString()),
              buildInfoTile("Position", widget.data.playerPosition.toString()),
              buildInfoTile("Rating", widget.data.playerRate.toString()),
              buildInfoTile("Player Status", widget.data.inTeam.toString()),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
