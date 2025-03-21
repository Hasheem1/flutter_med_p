import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../Customizedwidget/BookSnackBar.dart';

class ToledoDetails extends StatefulWidget {
  const ToledoDetails({super.key});

  @override
  State<ToledoDetails> createState() => _DetailsState();
}

class _DetailsState extends State<ToledoDetails> {
  static const List<String> sampleImages = [
"https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/458086784_1965552490554654_4256384242845382440_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=iSKl3uYmGP0Q7kNvgFjzbMq&_nc_oc=Adm5QTpEOmX6SX3P4a-aAwBFDysKFpHvyPFA_PwBEW-YQ_D1erOZ8DN8KLxpodMy24PxcvKf2-UvdxiaI5HMEYC0&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=pSmluyzpEvNH4-Jb6SHptA&oh=00_AYF91yARbDGMPN923nyG0rmST4tls64PKcPrJfNyJBuxKw&oe=67E3AA6C",
"https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/467766360_572949832048289_1813252537619372338_n.jpg?stp=dst-jpg_s960x960_tt6&_nc_cat=110&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=5YV4Kf39EToQ7kNvgH7i00E&_nc_oc=AdmghFe-Fs8AEOhoLenfdPeKaEsOM3AKyEZDJ1dZgfITn5To7k8xogl1TUpxY2VsWDw7469XxQK9bnaTu2STSnjl&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=TBhELqSrAsnW9cGG9kzgqw&oh=00_AYGOTXgmMnRAEL7CNsVLlwj1qokVv1atk-okfwZoO8yfsQ&oe=67E39DE8",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqRwNEsvG5JolF16IXWS7IAsZg54XVapgq4A&s"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),backgroundColor:Color(0xFF030E2F),iconTheme: IconThemeData(color: Colors.white,size: 35),),

      backgroundColor: Color(0xFF030E2F),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  toledo court-  1 court :",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF94e3a8)),
                ),
                SizedBox(height: 23),

                Row(
                  children: [
                    Text(
                      "Court Size: ",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF94e3a8)),
                    ),
                    Text(
                      "7-a-Side",
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  "Specifications:",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF94e3a8)),
                ),
                SizedBox(height: 10),

                Text(
                  "• Football available\n"
                      "• Cafeteria available\n"
                      "• The place is monitored by cameras\n"
                      "• Car parking available\n"
                      "• Safe playground\n"
                      "• FIFA specification grass",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
                SizedBox(height: 30),

                // Image Slider Section
                FanCarouselImageSlider.sliderType1(
                  imagesLink: sampleImages,
                  isAssets: false,
                  autoPlay: true,
                  sliderHeight: 250,
                  showIndicator: true,
                ),
                SizedBox(height: 20,),
                Center(
                  child: TextButton(onPressed: (){
                    showSnackBar(context,"Toledo stadium");
                  }, child: Text("BOOK Toledo stadium",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                    , style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF94e3a8),
                        maximumSize: Size(300, 150)

                    ),
                  ),
                )
              ],

            ),

          ),
        ),
      ),
    );
  }
}
