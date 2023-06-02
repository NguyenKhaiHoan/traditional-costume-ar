import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:traditional_costume_ar/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 230 : -200,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2400),
                opacity: animate ? 1 : 0,
                child: Row(
                  children: [
                    Image.asset('assets/images/try.png', width: width * 0.55,),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )
              )
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              bottom: animate ? 300 : -320,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2400),
                opacity: animate ? 1 : 0,
                child: LoadingAnimationWidget.inkDrop(color: Color.fromRGBO(255, 189, 89, 1), size: 30),
              )
          ),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 10000));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 6500));
    Navigator.pushReplacement(
      context,
      createRoute(
        OnboardingScreen(),
      ),
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
