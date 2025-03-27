import 'package:flutter/material.dart';
import '../../app/style/style.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        /// Determine font size based on screen width
        double imageHeight = screenHeight * 0.5;
        double imageWidth = screenWidth * 0.9;
        double buttonPadding = screenHeight * 0.03;

        return Scaffold(
            backgroundColor: whiteColor,
            body: ListView(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/onboarding_image.png',
                    fit: BoxFit.fill,
                    height: imageHeight,
                    width: imageWidth,
                  ),
                ),
                SizedBox(height: screenHeight*0.08,),
                 Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Easy Consultation with a Doctor in Your pocket',
                      style: TextStyle(
                        height: 1,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: darkGreenColor,
                      ),
                    ),
                  ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Korem ipsum dolor sit amet, consectetur adipiscing elit.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    color: customGreyColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(left: buttonPadding,right: buttonPadding,top: screenHeight*0.0,bottom: screenHeight*0.09),
              child: TextButton(onPressed: (){}, child: Text('Get Started')),
            ),
        );
      },
    );
  }
}


