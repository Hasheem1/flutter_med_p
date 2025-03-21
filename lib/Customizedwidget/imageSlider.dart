// import 'package:flutter/material.dart';
// import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   static const List<String> sampleImages = [
//     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK4R7Pg7cz4BjrSWjLeuzcHBTrTuDJBXLBGQ&s",
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK4R7Pg7cz4BjrSWjLeuzcHBTrTuDJBXLBGQ&s",
//         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK4R7Pg7cz4BjrSWjLeuzcHBTrTuDJBXLBGQ&s",
//
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 100,
//             ),
//
//             FanCarouselImageSlider.sliderType1(
//               imagesLink: sampleImages,
//               isAssets: false,
//               autoPlay: true,
//               sliderHeight: 300,
//               showIndicator: true,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }