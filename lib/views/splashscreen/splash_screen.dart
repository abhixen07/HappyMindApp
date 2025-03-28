import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/style/style.dart';
import '../../services/splashservice/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashService().startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: linearGradientSplash,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/svg/splash_logo_svg.svg',
              height: screenWidth*0.22,),
            ],
          ),
        ),
      ),
    );
  }
}
