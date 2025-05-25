import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_med_p/SignUp_LogIn/enterState.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor,
      appBar: AppBar(title: Center(child: Text("Settings",style: TextStyle(color: accentColor,fontWeight: FontWeight.bold,fontSize: 30),)
      ),
      backgroundColor: backgroundColor,),

body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Column(

      children: [
        SizedBox(height: 40,),
        AccountTile(title: "Account", leadingIcon: Icons.account_circle_sharp, accentColor: accentColor, textColor: textColor),
        AccountTile(title: "Notifications", leadingIcon: Icons.notifications, accentColor: accentColor, textColor: textColor),
        AccountTile(title: "Privacy & Security ", leadingIcon: Icons.lock, accentColor: accentColor, textColor: textColor),
        AccountTile(title: "Help and support", leadingIcon: Icons.headphones, accentColor: accentColor, textColor: textColor),
        AccountTile(title: "About", leadingIcon: Icons.help, accentColor: accentColor, textColor: textColor),
        AccountTile(title: "Delete Reservation", leadingIcon: Icons.delete, accentColor: accentColor, textColor: textColor,onTap: deleteReservation,)

      ],

    ),
    Column(mainAxisAlignment: MainAxisAlignment.end,

      children: [
        InkWell(onTap: () { logout();


        },
            child: Text("Log out", style: TextStyle(color: Colors.red,fontSize: 30),)),
      ],
    )
  ],
),


    );
  }
  void deleteReservation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("Delete Reservation", style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Call this number for more information:", style: TextStyle(color: Colors.white)),
              SizedBox(height: 10),
              Text("0798793250", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
  void logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:Colors.grey,
          title: Text("Log out of your account?", style: TextStyle(color: Colors.white)),
          content: Text(
            "Are you sure you want to log out?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Enterstate(),));


              },
              child: Text("OK", style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }


}

class AccountTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback? onTap;
  final Color accentColor;
  final Color textColor;

  const AccountTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
    required this.accentColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(leadingIcon, size: 30, color: accentColor),
                    const SizedBox(width: 8),
                    Text(title, style: TextStyle(fontSize: 30, color: textColor)),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, size: 30, color: accentColor),
              ],
            ),
          ),
        ],
      ),
    );

  }



}
