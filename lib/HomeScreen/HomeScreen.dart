import 'package:flutter/material.dart';
import '../Customizedwidget/HomeContainer.dart';
import '../SignUp_LogIn/Login.dart';
import 'HashemDetails.dart';
import 'YarmoukDetails.dart';
import 'toledoDetails.dart';

class Homescreen extends StatefulWidget {
  final Function(int) toggleFavorite;

   Homescreen({
    super.key,

    required this.toggleFavorite
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool FavIconPressed = false;
  Color color =  Colors.white;
//FavIconPressed ? Colors.red :
  final List<Map<String, dynamic>> stadiums = [
    {
      "networkImage":
      "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/294830913_526610772522619_5920334590357221201_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHs3Apcvj-BOtlxRZIPbBA_vE3qtxOg9VK8Teq3E6D1UnHNga8z7rV5VracSDantNaB8t4DFqdvEP4ZqiIzQDQt&_nc_ohc=M3Bx2CpbH_AQ7kNvwHMuQFX&_nc_oc=AdnIscWKGPZrJ4p8z9CxS1St-Y0gPs4HK8i_hjpCV9p-MCEnPpdsAl4Nb2rLsJ5n-tWMvk98nEAx6rfqUoL-6Eif&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=M2PlIl78TOMi5rxuv8PzeQ&oh=00_AfKAeTMWUrNAe21AFD5Qs9q7FvZf05nTbMsDvjHKp5oSbw&oe=6838E554",
      "text": "Hashem Stadium",
      "targetScreen": HashemDetails(),
      'isFavorite': false
    },
    {
      "networkImage":
      "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/301537330_432735345590382_680355683789910258_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHzTDjL0BHBggMk3fBmXPC1F-KGetbWc0kX4oZ61tZzSVGJxpZCb6AiL-SuYFQMaO9ZDuYwWUL07FdNV--G7I0N&_nc_ohc=iNgJ8gGoZosQ7kNvwHgST04&_nc_oc=AdlYsfCfWRXpFujubJI7jtWTrGr-BDWVIGeF16gmjLG6hjPbUW5m5gWgPq3hl2pBgx8xMbTeVzO8wR3Xx2Eh-0u-&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=HUbTB10dbsnMxvpiklHmPQ&oh=00_AfIAXUMJG7v22yMbpU7vlqmMzqhfXAiFbF03yZ6y861QbA&oe=6838F802",
      "text": "Toledo Stadium",
      "targetScreen": ToledoDetails(),
      'isFavorite': false
    },
    {
      "networkImage":
      "https://scontent.famm6-1.fna.fbcdn.net/v/t39.30808-6/299598202_397098279232913_1864171592706308853_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeGlju57SSuObozoFTjauiJy6ar1D9sDZ9XpqvUP2wNn1XTV6ypO6FgOR4EqXjEug9-ZrKPK3eXjV1VjgRn-6D0U&_nc_ohc=roRWLw8pGT4Q7kNvwHTUINo&_nc_oc=Adm3rW5hov1kegj6hVE-8YVSB5Qh5kDk1zODbfIANq53sFdnWZzI-qVmSVJBOQtyR0VjypaBSfGOpyD4_19pRuN5&_nc_zt=23&_nc_ht=scontent.famm6-1.fna&_nc_gid=_TBOg2vNHw2dYRNrjNSnkQ&oh=00_AfLgFy40KBpvhJDEGal2C9LbG0YPUhbNzBaTWjYKyzKtkQ&oe=6838C7F4",
      "text": "Yarmouk Stadium",
      "targetScreen": YarmoukDetails(),
      'isFavorite': false
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
                    isFavorite: FavIconPressed,
                    onFavoriteChanged: (isFav) {
                      setState(() {
                        // toggleFavorite(index);
                        widget.toggleFavorite(index);
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
