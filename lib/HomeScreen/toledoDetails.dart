import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

import '../Customizedwidget/BookSnackBar.dart';
import '../Reservations/Reservations.dart';

class ToledoDetails extends StatefulWidget {
  const ToledoDetails({super.key});

  @override
  State<ToledoDetails> createState() => _DetailsState();
}

class _DetailsState extends State<ToledoDetails> {
  String selectedStadium="Toledo Stadium";
  static const List<String> sampleImages = [
"https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/490061467_2137491190027449_2294138513476869834_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeFJT9q7Z6Ozbxp9G4-BXCjDB6R9JrG_yJ0HpH0msb_InbkZBC67SLizmUKQ_G-PYvbkgSbHTuivlHXs3VCVNJ52&_nc_ohc=u27vQYaBpkcQ7kNvwH5djCB&_nc_oc=AdklTQtjWqXrHeTqTSfQ3sOl5ZT2ZGx0Vs-Kup1D5Vr03zzgevdehMwVm-m6Mn4mJrAgzNaJkSHZfgPAjRNLL1XD&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=W0ZkxMSKJCn1egnjIq9NHg&oh=00_AfJfYch456GKHDVSQutK36O71vE3VXgC6XGheHGejb5Tug&oe=6838EAD6",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk1hBkeQPsPqhZ2otlJVjC2kS8PQYQD0PQTw&s",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationScreen(selectedStadium),));
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
