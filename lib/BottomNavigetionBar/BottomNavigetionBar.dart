// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_med_p/Customizedwidget/UsersData.dart';
// import 'package:flutter_med_p/HomeScreen/HomeScreen.dart';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
// import '../Customizedwidget/HomeContainer.dart';
// import '../Data/displayData.dart';
// import '../HomeScreen/FavoriteScreen.dart';
// import '../SignUp_LogIn/enterState.dart';
//
// class SnakeNavigationBarExampleScreen extends StatefulWidget {
//   @override
//   _SnakeNavigationBarExampleScreenState createState() =>
//       _SnakeNavigationBarExampleScreenState();
// }
//
// class _SnakeNavigationBarExampleScreenState
//     extends State<SnakeNavigationBarExampleScreen> {
//   final PageController _pageController = PageController(initialPage: 1);
//
//   int _selectedItemPosition = 1;
//   Color? containerColor;
//   List<Color> containerColors = [
//     Color(0xFF030E2F),
//     Color(0xFF030E2F),
//     Color(0xFF030E2F),
//     Color(0xFF030E2F)
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (index) {
//           setState(() {
//             _selectedItemPosition = index;
//             containerColor = containerColors[index];
//           });
//         },
//         children: [
//           DisplayData(Data("name", "age", "playerPosition", "playerRate", "inTeam")),
//           Homescreen(name: "name", age: "age", position: "position", rate: "rate", proOrNo: "proOrNo"),
//           FavoriteScreen(),
//           Enterstate()
//         ],
//       ),
//       bottomNavigationBar: SnakeNavigationBar.color(
//         backgroundColor: Color(0xFF030E2F),
//         behaviour: SnakeBarBehaviour.pinned,
//         snakeShape: SnakeShape.circle,
//         padding:  EdgeInsets.all(12),
//         snakeViewColor: Colors.white,
//         selectedItemColor: Color(0xFF94e3a8),
//         unselectedItemColor: Color(0xFF94e3a8),
//         currentIndex: _selectedItemPosition,
//         onTap: (index) {
//           if (index == 3) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => Enterstate()),
//             );
//           } else {
//             _pageController.jumpToPage(index);
//           }
//         },
//         items:  [
//           BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
//           BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Log out'),
//         ],
//       ),
//     );
//   }
// }
