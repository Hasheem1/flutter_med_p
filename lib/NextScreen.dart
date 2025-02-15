import 'package:flutter/material.dart';
import 'Customizedwidget/UsersData.dart';
import 'displayData.dart';

class NextScreen extends StatefulWidget {
  final String name;
  final String age;
  final String position;
  final String rate;
  final String proOrNo;

  const NextScreen({
    super.key,
    required this.name,
    required this.age,
    required this.position,
    required this.rate,
    required this.proOrNo,
  });

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Step")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Click the icon to proceed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

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
              icon: Icon(Icons.arrow_forward, size: 50, color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
