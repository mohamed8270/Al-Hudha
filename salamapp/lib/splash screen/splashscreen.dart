import 'dart:async';
import 'package:flutter/material.dart';
import 'package:salamapp/interface/bottomnav.dart';
import 'package:salamapp/onboard%20screen/onboard.dart';
import 'package:salamapp/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNav(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kblack,
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Kblack,
            image: DecorationImage(
              image: AssetImage('assets/images/Splash screen.png'),
            ),
          ),
        ),
      ),
    );
  }
}
