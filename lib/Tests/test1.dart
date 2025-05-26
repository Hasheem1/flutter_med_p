// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_med_p/BottomNavigetionBar/gitInfoFromFire.dart';
// class displayData extends StatefulWidget {
//   const displayData({super.key});
//
//   @override
//   State<displayData> createState() => _displayDataState();
// }
//
// class _displayDataState extends State<displayData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor:   Color(0xFF030E2F),
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//
//                   SizedBox(height: 20,),
//                   GetUserName(FirebaseAuth.instance.currentUser!.uid)
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
