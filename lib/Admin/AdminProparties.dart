import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Adminproparties extends StatefulWidget {
  const Adminproparties({super.key});

  @override
  State<Adminproparties> createState() => _AdminpropartiesState();
}

class _AdminpropartiesState extends State<Adminproparties> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFF030E2F),
      appBar: AppBar(title:Text("Admin Properties ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),backgroundColor:Color(0xFF030E2F),iconTheme: IconThemeData(color: Colors.white,size: 35),),

      body: Container(width: double.infinity,height: double.infinity,

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 1,),
              // Text("Admin Properties ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
              SizedBox(height: 20,),
              Lottie.network("https://lottie.host/7e6e9070-23e8-4cad-8320-5d249f352822/tMPWG9rUnK.json",width: 200,height: 200),
              Text("add stadiums",style: TextStyle(color: Colors.white,fontSize: 18,),),
              SizedBox(height: 20,),
              Container(decoration: BoxDecoration(),
                  child: Lottie.network("https://lottie.host/2e69dc22-2905-49cc-aca7-86c5562b4f1f/uehy5N8sae.json",width: 200,height: 200)),
              Text("modify stadiums",style: TextStyle(color: Colors.white,fontSize: 18),),
              Lottie.network("https://lottie.host/31922e66-6ee7-4ae4-907a-f64798acbd16/ajqegm2QOo.json",width: 200,height: 200),
              Text("delete stadiums",style: TextStyle(color: Colors.white,fontSize: 18),),
              SizedBox(height: 20,),

            ],
                ),
        ),

      ),
    );
  }
}
