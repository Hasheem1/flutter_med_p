import 'package:flutter/material.dart';

String showSnackBar(BuildContext context, String stadiumName) {
  final snackBar = SnackBar(
    backgroundColor: Colors.yellow[400],
    content: Center(
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(
            Icons.check,
            color: Colors.green,
            size: 40,
          ),
          SizedBox(width: 50),
          Text(
            '$stadiumName booked',
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.yellow[300],
            ),
          ),
        ],
      ),
    ),
    duration: Duration(seconds: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return '$stadiumName booked successfully!';
}
