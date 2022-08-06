import 'package:flutter/material.dart';
import './screens/loginscreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.png',
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: LoginScreenPage(),
      pageTransitionType: PageTransitionType.bottomToTop,
      duration: 1500,
     splashIconSize: 150,
      backgroundColor: Colors.white,
    );
  }
}
