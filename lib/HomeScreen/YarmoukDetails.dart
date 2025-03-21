import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../Customizedwidget/BookSnackBar.dart';

class YarmoukDetails extends StatefulWidget {
  const YarmoukDetails({super.key});

  @override
  State<YarmoukDetails> createState() => _DetailsState();
}

class _DetailsState extends State<YarmoukDetails> {
  static const List<String> sampleImages = [
   "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/464447981_8535832423173037_5287080858927625173_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=uSmXFTzAAN0Q7kNvgF1idRd&_nc_oc=AdnupC4mrUg1s3fK8D8mKx1SxYwAqysyDeyC48UIFCgNs4MuMIJ5Ea61ezepXHSI-BanMfQ5RideYMtL8F2U0hAd&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=TNVLql6HTnbPJoMk7chsMg&oh=00_AYHpDTJn4opOPz2e2jRQ1XZCDh4MMt2LMchpaGXqJEu9Rg&oe=67E37F20",
    "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/464557763_8545439628878983_1306003066451519933_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=833d8c&_nc_ohc=_fgaatbSmMkQ7kNvgHtOORK&_nc_oc=Adnrogf21KQ6HPASoPtjvUbF40cAjO3P10oXSYGIHtdzQCOJLioMsfyujQ380c4T0equdRCENq98Ebr_aR_c9YrJ&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=X00mkRvOWE5PaASjTLS-rw&oh=00_AYHPM2sWEBuQJrsZbi6as3DZtyVVfHME83pVjPIosGnv_g&oe=67E38B8B",
    "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/464543882_9514933888531340_1401469323842194503_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=UZSHl8B7sgwQ7kNvgEXLvr5&_nc_oc=Admk8vO-WygG2vilakhwoZx1EcXIISf36mXTyTpQ1dndjBSXZBa68dXojnSR_K4WZiXWpJQIQtxksE6a8aVBwaCJ&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=vRd4yj3iiTZs-12t_8o16A&oh=00_AYE8ZaHgtr4wOXJfVhRYgtbHpC_PVwF8OOUscEENxQiXqA&oe=67E39ADC"
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
                  "  Yarmouk court-  1 court :",
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
                      "6-a-Side",
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
                    showSnackBar(context,"Yarmouk stadium");
                  }, child: Text("BOOK Yarmouk stadium",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
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
