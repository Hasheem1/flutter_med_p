import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../Customizedwidget/BookSnackBar.dart';
import '../Reservations/Reservations.dart';

class HashemDetails extends StatefulWidget {
  const HashemDetails({super.key});

  @override
  State<HashemDetails> createState() => _DetailsState();
}

class _DetailsState extends State<HashemDetails> {
  String selectedStadium="Hashem Stadium";
  static const List<String> sampleImages = [
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwieRKUoLR2301PpPIJcEPquaML3hjIf91cw&s",
 "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/463899862_2786022721566155_6073433217267447899_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeFDhFpiPbPiY2j7FsIUFVnS1bokdnAJL1LVuiR2cAkvUh-YbZlWOb_lvUyKagRIpUC8vs8i5KcHPz3FJ5cacWbV&_nc_ohc=g4f0HR1_x8QQ7kNvwE8H3SU&_nc_oc=AdmwLVKcopGN2DFZeJqOvpBzxuJ6SSF9A4O2PSvW43jwo4RXBwXng8wRsa4LN9DkY-4AluSmf6lxKHUs4bUC9O97&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=hA0xSPunIhi-JynUrct-8Q&oh=00_AfLbG9dULPaZAHXwVJiqV5HRCsGCQjjYirdJeJZ7H21gkA&oe=6838D195",
    "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/461601294_2764229737078787_987316873294270768_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeFa2nmC7co7don__8Ud5ub9YZdK81_qPXJhl0rzX-o9cuWvuCFvnEuHQq5qlttB9zHuWlz3wrNYHlfLUw1Xc1BQ&_nc_ohc=ZWfrVWvcdQAQ7kNvwGZfm7a&_nc_oc=AdnxFsqR5laf0LcyPbY2Gq9Hd5PVlxNDgIOf4r_WHYwqa2Q2VTJSJVHRVS6bXpkH78RKsLh6JzKhmpTrmllbdLas&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=kwxn7mBjf_51MnuZD2LjSg&oh=00_AfIn7OTI3-BeuW562iQg3GZTYNnxT3U4XRtqAoFjCXzxOg&oe=6838F388",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationScreen(selectedStadium),));
                  },
                    child: Text("BOOK hashem stadium",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
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
