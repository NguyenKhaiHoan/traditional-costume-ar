import '/pages/explore.dart';
import '/pages/favorite.dart';
import '/pages/home.dart';
import '/pages/try_on.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Root extends StatefulWidget {
  int selectIndex;

  Root({Key? key, required this.selectIndex,}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  pageCaller(int index) {
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
          child: pageCaller(widget.selectIndex),
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
          currentIndex: widget.selectIndex,
          onTap: (index) {
            if (index != 2) {
              setState(() {
                widget.selectIndex = index;
              });
            } else {
              Navigator.push(
                context,
                createRoute(
                  TryOnPage(),
                  // TakePictureScreen(camera: widget.camera)
                ),
              );
            }
          },
        )
    );
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}