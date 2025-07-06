import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_med_p/SignUp_LogIn/enterState.dart';
import 'package:flutter_med_p/settings/support/Faq%20S.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'App Settings/Languge.dart';
import 'Legal/Rules Book.dart';
import 'Legal/Terms&conditions.dart';
import 'Legal/privacy&policy.dart';
import 'our team/Join us.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;
  static const IconData policy = IconData(0xe4d9, fontFamily: 'MaterialIcons');
  static const IconData rule_rounded = IconData(0xf011d, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("APP SETTINGS ",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  InkWell(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectLanguageScreen()));
                    },
                    child: AccountTile(
                        title: "language",
                        leadingIcon: Icons.language_sharp,
                        accentColor: accentColor,
                        textColor: textColor),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("SUPPORT",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  InkWell(
                    child: AccountTile( 
                        title: "FAQ’s",
                        leadingIcon: Icons.question_mark,
                        accentColor: accentColor,
                         textColor: textColor,
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQScreen()));
                    },),

                  ),
                  
                  
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("LEGAL",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  AccountTile(
                      title: "Privacy & Policy ",
                      leadingIcon: Icons.lock,
                      accentColor: accentColor,
                      textColor: textColor,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                    );

                  },),

                  AccountTile(
                      title: "Terms & Conditions",
                      leadingIcon: policy,
                      accentColor: accentColor,
                      textColor: textColor,
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()),
                  );
                  },),
                  AccountTile(
                      title: "Rules Book",
                      leadingIcon: rule_rounded,
                      accentColor: accentColor,
                      textColor: textColor,
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RulesBookScreen()),
                  );
                  },),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("OUR TEAM",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  AccountTile(
                      title: "Join Us",
                      leadingIcon: Icons.headphones,
                      accentColor: accentColor,
                      textColor: textColor,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JoinUsScreen()),
                    );

                  },),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text("RESERVATION CANCELLATIONS",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                  AccountTile(
                    title: "CANCELLATIONS",
                    leadingIcon: Icons.delete,
                    accentColor: accentColor,
                    textColor: textColor,
                    onTap: deleteReservation,
                  ),
                ],
              ),
            ),



            SizedBox(height: 20),

            // Second social icon row with FontAwesome icons wrapped in horizontal scroll
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.whatsapp, size: 40, color: Colors.green),
                        SizedBox(height: 5),
                        Text('WhatsApp', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.instagram, size: 40, color: Colors.purple),
                        SizedBox(height: 5),
                        Text('Instagram', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.tiktok, size: 40, color: Colors.white),
                        SizedBox(height: 5),
                        Text('TikTok', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.youtube, size: 40, color: Colors.red),
                        SizedBox(height: 5),
                        Text('YouTube', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    logout();
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                ),
              ],
            )
          ],
        ),
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
          backgroundColor: Colors.grey,
          title: Text("Log out of your account?", style: TextStyle(color: Colors.white)),
          content: Text(
            "Are you sure you want to log out?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Enterstate(),
                  ),
                );
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
                    Icon(leadingIcon, size: 25, color: accentColor),
                    const SizedBox(width: 8),
                    Text(title, style: TextStyle(fontSize: 25, color: textColor)),
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
