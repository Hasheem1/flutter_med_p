import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../Customizedwidget/BookSnackBar.dart';
import '../Reservations/Reservations.dart';

class YarmoukDetails extends StatefulWidget {
   YarmoukDetails({super.key});
  @override
  State<YarmoukDetails> createState() => _DetailsState();
}

class _DetailsState extends State<YarmoukDetails> {
  String selectedStadium= "Yarmouk Stadium";

  static const List<String> sampleImages = [
   "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/464703683_8545439838878962_2837724231012393494_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeG4fN7m3HoqAvUZuT0z9uqwQ9H9sC_RacxD0f2wL9FpzG6yfCbRSfrsUdMO7bUsaJz5R-wGY-bOao5rijyvCMOG&_nc_ohc=xcJTMVDStkwQ7kNvwEy0YhQ&_nc_oc=AdnsQo2Ssv3kEjOo5GSc4cKbKI-ZPneYID4bezcPQcBHb8AzyaRJ_LzlrTIvkAm5hi2UuT_F0rb1rZwtWWdgTRG7&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=wT5H79qrBYkemPHeN97g3w&oh=00_AfIuf2UtcF2q7szogLdWFWoqLJdXP4wD6wi-XDiHbKzv5A&oe=6838FC3C",
    "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/464447981_8535832423173037_5287080858927625173_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeGzO8Z0HjYqviVA-ss1wPFwhEs6uf6hA9GESzq5_qED0ajiTDmL2zVV5FH6UPMnx3GistZmk7HpDhGBWrwMUpZW&_nc_ohc=xca_8Jj8RRgQ7kNvwHvZs6-&_nc_oc=Adm6C_vujCtXnbdYvjXhWFJHgzPMFdhAsU2SXPBAtidKviMtXrNAxkLB3DlqR5mTGpbCxOYgKpxg-5CHeR1xXd9S&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=kv8pFkgplXatI_5v7vd5Fg&oh=00_AfIvKm-LYD1ln8fpkkgb4Pbd-lIBVMlLT-zWSdBEiO_h1A&oe=6838F860",
    "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/464472945_8540910702665209_6737614677985029031_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeEWt9EEtbsHZK71yrPcJiauO054-257sRY7Tnj7bnuxFjwgZJLZeWTIAwyilipCQjQGwna7yCtuY_0LZM3wFr9J&_nc_ohc=mZ9v-I4W0VsQ7kNvwGUzEyl&_nc_oc=AdkH96eNc6JTaoUWIKDk8wdJCfOAouPqNLpR52O8BHmcDJKuCbfKFB-EOBt3g9rOCJzbXNyh_UtWZ_i3otCrlnml&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=hjPOFEbiSdN_GbyA5oQI4g&oh=00_AfIYuommairXhF4wImc1GqcW17xvKt0f_cvk4uY6UW-SEA&oe=6838D091"
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationScreen(selectedStadium),));
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
