import '/pages/explore.dart';
import '/pages/favorite.dart';
import '/pages/home.dart';
import '/pages/try_on.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;

  static pageCaller(int index) {
    switch (index) {
      case 0:
        {
          return HomePage();
        }
      case 1:
        {
          return ExplorePage();
        }
      case 3:
        {
          return FavoritePage();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: pageCaller(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.home),
                label: 'Home',
                activeIcon: Icon(IconlyBold.home)
            ),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.search),
                label: 'Explore',
                activeIcon: Icon(IconlyBold.search)
            ),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.camera),
                label: 'Try On',
                activeIcon: Icon(IconlyBold.camera)
            ),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.heart),
                label: 'Favorite',
                activeIcon: Icon(IconlyBold.heart)
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (index != 2) {
              setState(() {
                _selectedIndex = index;
              });
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TryOnPage()),
              );
            }
          },
        )
    );
  }
}