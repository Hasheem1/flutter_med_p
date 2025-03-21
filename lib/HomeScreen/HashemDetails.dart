import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../Customizedwidget/BookSnackBar.dart';

class HashemDetails extends StatefulWidget {
  const HashemDetails({super.key});

  @override
  State<HashemDetails> createState() => _DetailsState();
}

class _DetailsState extends State<HashemDetails> {
  static const List<String> sampleImages = [
    "https://scontent.famm11-1.fna.fbcdn.net/v/t1.6435-9/60786026_1235375143297595_8112669266198659072_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=Ant3YrQn8TYQ7kNvgEqupMS&_nc_oc=Adl-kM0QT_2Ha2sLepbQZWv5TlGJ4fq440a-PZkx8BQrnQYsTKIg9nVbHa3Q6uYqqBh9jSMCmTMzwymFzJi6syLt&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=kjwmFg6VB-nUVkkXNEnHbg&oh=00_AYEwfCSulKAkFA3yILuoM1jNVlZYQQVim4kVnz0qkcD_ng&oe=680546AB",
    "https://scontent.famm11-1.fna.fbcdn.net/v/t1.6435-9/81660755_1433995040102270_3735439332001972224_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=127cfc&_nc_ohc=TxRbs0YppFEQ7kNvgGBJHFJ&_nc_oc=AdgytOwwI1eefFv7dBMpEsQYXPb7VmQfa0-qmSJiqVi_X58mw-Axde3bw5oRxvSewgGDEOhF8owTTsY-V1IHMIz2&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=dls0NEqWYXqGWOwVLZITIg&oh=00_AYGydivkDasH7xbsio1CthhTRpPlG07p5GHiejThqMAOHw&oe=67FE7EEC",
    "https://scontent.famm11-1.fna.fbcdn.net/v/t1.6435-9/94032904_1524340027734437_4014256780518359040_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_ohc=_JVYOGs3JioQ7kNvgE3d-A6&_nc_oc=Adi7zljpT6vkDVlba6-fnvGccZDDV1IDyQnclPRsfDcx53rDb5gAq3VaI-0UqPLGnVJbKHSxt4IVa3Z7GFERKx3Q&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=pFFUKAej-JLwOGv1zsKCUg&oh=00_AYGci6Z17sZC_Dmv4-BGvG6223_W5gJKFA-XgVKStZJt7w&oe=67FE8CE6",
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
                  "  hashem court-  1 court :",
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
                  "• Cafeteria available\n"
                  "• The place is monitored by cameras\n"
                  "• Car parking available\n"
                  "• Changing rooms\n"
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
                    showSnackBar(context,"Hashem stadium");
                  }, child: Text("BOOK hashem stadium",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
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
