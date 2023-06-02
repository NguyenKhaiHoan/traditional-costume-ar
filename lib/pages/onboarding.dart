import '/pages/root.dart';
import 'package:flutter/material.dart';
import '/models/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  List<Onboarding> onboardingList = Onboarding.onboardingList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/onboarding.png', fit: BoxFit.fill,),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/onboarding.png', fit: BoxFit.fill,),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset('assets/images/onboarding.png', fit: BoxFit.fill,),
              ),
            ],
          ),
          Positioned(
              bottom: 170,
              left: 30,
              right: 30,
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onboardingList[currentIndex].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        onboardingList[currentIndex].description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
              )
          ),
          Positioned(
            bottom: 80,
            left: 30,
            right: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      } else {
                        Navigator.push(
                          context,
                          createRoute( Root(selectIndex: 0,)));
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 24,
                    color: Color(0xff1b2028),
                  )),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
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