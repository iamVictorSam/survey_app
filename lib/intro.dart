import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:survey_app/splash/splash_screen.dart';

class InitScreen extends StatefulWidget {
  static String routeName = '/initScreen';

  const InitScreen({super.key});
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SizedBox(
          child: Center(
            // flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset('assets/Travi Logo.jpg'),
              // child: Text(
              //   'Survey App',
              //   style: TextStyle(
              //       fontSize: 30.sp,
              //       fontWeight: FontWeight.w700,
              //       color: Colors.deepPurple),
              // ),
            ),
          ),
        ),
        splashIconSize: 280.0,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 2500,
        nextScreen: const SplashScreen());
  }
}
