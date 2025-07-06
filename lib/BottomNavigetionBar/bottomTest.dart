import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_med_p/HomeScreen/FavoriteScreen.dart';
import 'package:flutter_med_p/HomeScreen/HomeScreen.dart';
import '../Customizedwidget/UsersData.dart';
import '../Data/displayData.dart';
import '../HomeScreen/HashemDetails.dart';
import '../HomeScreen/YarmoukDetails.dart';
import '../HomeScreen/toledoDetails.dart';
import '../Reservations/MyReservationScreen.dart';
import '../SignUp_LogIn/enterState.dart';
import '../Tests/test1.dart';
import '../settings/settings.dart';

class Bottomtest extends StatefulWidget {
  @override
  State<Bottomtest> createState() => _BottomtestState();
}

class _BottomtestState extends State<Bottomtest> {
  bool _isLoggedOut = false;

  final List<Map<String, dynamic>> stadiums = [
    {
      "networkImage":
      "https://scontent.famm11-1.fna.fbcdn.net/v/t1.6435-9/94032904_1524340027734437_4014256780518359040_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_ohc=_JVYOGs3JioQ7kNvgE3d-A6&_nc_oc=Adi7zljpT6vkDVlba6-fnvGccZDDV1IDyQnclPRsfDcx53rDb5gAq3VaI-0UqPLGnVJbKHSxt4IVa3Z7GFERKx3Q&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=pFFUKAej-JLwOGv1zsKCUg&oh=00_AYGci6Z17sZC_Dmv4-BGvG6223_W5gJKFA-XgVKStZJt7w&oe=67FE8CE6",
      "text": "Hashem Stadium",
      "targetScreen": HashemDetails(),
      'isFavorite': false,
    },
    {
      "networkImage":
      "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/458086784_1965552490554654_4256384242845382440_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=iSKl3uYmGP0Q7kNvgFjzbMq&_nc_oc=Adm5QTpEOmX6SX3P4a-aAwBFDysKFpHvyPFA_PwBEW-YQ_D1erOZ8DN8KLxpodMy24PxcvKf2-UvdxiaI5HMEYC0&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=pSmluyzpEvNH4-Jb6SHptA&oh=00_AYF91yARbDGMPN923nyG0rmST4tls64PKcPrJfNyJBuxKw&oe=67E3AA6C",
      "text": "Toledo Stadium",
      "targetScreen": ToledoDetails(),
      'isFavorite': false,
    },
    {
      "networkImage":
      "https://scontent.famm11-1.fna.fbcdn.net/v/t39.30808-6/464447981_8535832423173037_5287080858927625173_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=833d8c&_nc_ohc=uSmXFTzAAN0Q7kNvgF1idRd&_nc_oc=AdnupC4mrUg1s3fK8D8mKx1SxYwAqysyDeyC48UIFCgNs4MuMIJ5Ea61ezepXHSI-BanMfQ5RideYMtL8F2U0hAd&_nc_zt=23&_nc_ht=scontent.famm11-1.fna&_nc_gid=TNVLql6HTnbPJoMk7chsMg&oh=00_AYHpDTJn4opOPz2e2jRQ1XZCDh4MMt2LMchpaGXqJEu9Rg&oe=67E37F20",
      "text": "Yarmouk Stadium",
      "targetScreen": YarmoukDetails(),
      'isFavorite': false,
    },
  ];

  List<Map<String, dynamic>> favoriteStadiums = [];

  void toggleFavorite(int index) {
    setState(() {
      stadiums[index]['isFavorite'] = !stadiums[index]['isFavorite'];
      if (stadiums[index]['isFavorite']) {
        favoriteStadiums.add(stadiums[index]);
      } else {
        favoriteStadiums.removeWhere(
                (item) => item['text'] == stadiums[index]['text']);
      }
    });
  }

  int _currentIndex = 2;
  String? _currentUserEmail;
  bool _isLoadingUser = true;

  @override
  void initState() {
    super.initState();
    _loadCurrentUserEmail();
  }

  Future<void> _loadCurrentUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUserEmail = user?.email;
      _isLoadingUser = false;
    });
  }

  List<Widget> _buildPages(String currentUserEmail) {
    return [
      displayData(),
      ReservationBooked(userEmail: currentUserEmail),
      Homescreen(toggleFavorite: toggleFavorite),
      FavoritesPage(favorites: favoriteStadiums),
      Settings(),
    ];
  }

  void _handleLogout() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      _isLoggedOut = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedOut) {
      return Enterstate();
    }

    if (_isLoadingUser) {
      return Scaffold(appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
        backgroundColor: Color(0xFF030E2F),
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _buildPages(_currentUserEmail!),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 5) {
            _handleLogout();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF030E2F),
            icon: Icon(Icons.info),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF030E2F),
            icon: Icon(Icons.calendar_month),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF030E2F),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF030E2F),
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF030E2F),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),

        ],
      ),
    );
  }
}
