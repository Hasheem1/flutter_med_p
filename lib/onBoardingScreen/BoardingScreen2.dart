import 'package:flutter/material.dart';
class BordingScreen2 extends StatefulWidget {
  const BordingScreen2({super.key});

  @override
  State<BordingScreen2> createState() => _BordingScreen2State();
}

class _BordingScreen2State extends State<BordingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e74e7002-7e71-4d38-b7aa-324a199423f8/db83js2-1ae4f31a-ddc9-4899-a7a5-2c876ed1127f.jpg/v1/fill/w_1024,h_2088,q_75,strp/cristiano_ronaldo_real_madrid_iphone_wallpaper_hd_by_adi_149_db83js2-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjA4OCIsInBhdGgiOiJcL2ZcL2U3NGU3MDAyLTdlNzEtNGQzOC1iN2FhLTMyNGExOTk0MjNmOFwvZGI4M2pzMi0xYWU0ZjMxYS1kZGM5LTQ4OTktYTdhNS0yYzg3NmVkMTEyN2YuanBnIiwid2lkdGgiOiI8PTEwMjQifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.8IUReYVwDiutp6vfDbBx6rjcCki7G1dbHIhrDorZXRA"),fit: BoxFit.fill)),
        child: Container(height: double.infinity,width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40,),

              Text("You Don't Have Team To Play With ?",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      ),
    );
  }
}
