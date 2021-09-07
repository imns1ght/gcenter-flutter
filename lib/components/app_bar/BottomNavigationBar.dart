import 'package:flutter/material.dart';
import 'package:gcenter/screens/HomeScreen.dart';
import 'package:gcenter/screens/ProfileScreen.dart';

BottomNavigationBar bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Theme.of(context).primaryColor,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(.60),
    selectedFontSize: 14,
    unselectedFontSize: 14,
    onTap: (value) {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            switch (value) {
              case 3:
                return ProfileScreen(context);
              default:
                return HomeScreen(context);
            }
          },
        ),
      );
    },
    items: [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: "News",
        icon: Icon(Icons.library_books),
      ),
      BottomNavigationBarItem(
        label: "Favorites",
        icon: Icon(Icons.favorite),
      ),
      BottomNavigationBarItem(
        label: "Profile",
        icon: Icon(Icons.account_circle),
      ),
    ],
  );
}
