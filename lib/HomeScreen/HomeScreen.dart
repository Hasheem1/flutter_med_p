import 'package:flutter/material.dart';
import '../Customizedwidget/HomeContainer.dart';
import '../SignUp_LogIn/Login.dart';
import 'HashemDetails.dart';
import 'YarmoukDetails.dart';
import 'toledoDetails.dart';

class Homescreen extends StatefulWidget {
  final String name;
  final String age;
  final String position;
  final String rate;
  final String proOrNo;

  const Homescreen({
    super.key,
    required this.name,
    required this.age,
    required this.position,
    required this.rate,
    required this.proOrNo,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool FavIconPressed = false;
  Color IconColor = Colors.white;

  final List<Map<String, dynamic>> stadiums = [
    {
      "networkImage":
      "https://scontent.famm11-1.fna.fbcdn.net/v/t1.6435-9/94032904_1524340027734437_4014256780518359040_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_ohc=_JVYOGs3JioQ7kNvgE3d-A6&_nc_oc=Adi7zljpT6vkDVlba6-fnvGccZDDV1IDyQnclPRsfDcx53rDb5gAq3VaI-0UqPLGnVJbKHSxt4IVa3Z7GFERKx3Q&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=pFFUKAej-JLwOGv1zsKCUg&oh=00_AYGci6Z17sZC_Dmv4-BGvG6223_W5gJKFA-XgVKStZJt7w&oe=67FE8CE6",
      "text": "Hashem Stadium",
      "targetScreen": HashemDetails(),
    },
    {
      "networkImage":
      "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/458086784_1965552490554654_4256384242845382440_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=iSKl3uYmGP0Q7kNvgFjzbMq&_nc_oc=Adm5QTpEOmX6SX3P4a-aAwBFDysKFpHvyPFA_PwBEW-YQ_D1erOZ8DN8KLxpodMy24PxcvKf2-UvdxiaI5HMEYC0&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=pSmluyzpEvNH4-Jb6SHptA&oh=00_AYF91yARbDGMPN923nyG0rmST4tls64PKcPrJfNyJBuxKw&oe=67E3AA6C",
      "text": "Toledo Stadium",
      "targetScreen": ToledoDetails(),
    },
    {
      "networkImage":
      "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/464447981_8535832423173037_5287080858927625173_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=uSmXFTzAAN0Q7kNvgF1idRd&_nc_oc=AdnupC4mrUg1s3fK8D8mKx1SxYwAqysyDeyC48UIFCgNs4MuMIJ5Ea61ezepXHSI-BanMfQ5RideYMtL8F2U0hAd&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=TNVLql6HTnbPJoMk7chsMg&oh=00_AYHpDTJn4opOPz2e2jRQ1XZCDh4MMt2LMchpaGXqJEu9Rg&oe=67E37F20",
      "text": "Yarmouk Stadium",
      "targetScreen": YarmoukDetails(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF030E2F),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: stadiums.length,
                itemBuilder: (context, index) {
                  return HomeContainer(
                    networkImage: stadiums[index]["networkImage"],
                    text: stadiums[index]["text"],
                    targetScreen: stadiums[index]["targetScreen"],
                    onFavoriteChanged: (isFav) {
                      setState(() {
                        if (isFav) {
                          print("${stadiums[index]['text']} added to favorites!");
                        } else {
                          print("${stadiums[index]['text']} removed from favorites!");
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
