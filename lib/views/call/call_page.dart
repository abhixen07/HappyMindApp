import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happymindapp/app/style/style.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent, // background gradient color
      body: Container(
        decoration: BoxDecoration(
          gradient: linearGradientCall
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            SizedBox(height: screenHeight * 0.16),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: whiteColor,
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: screenWidth * 0.19,
                  backgroundColor: whiteColor,
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/10.jpg",
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            // Doctor Name
            Center(
              child: Text(
                'Dr.Asim',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                  color: blackColor,
                ),
              ),
            ),

            // Status
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: Text(
                'Ringing',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),

            // Bottom Icons
            SizedBox(height: screenHeight * 0.28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildCircleButton(
                  context,
                  (){},
                  'assets/svg/videoicon.svg',
                  whiteColor,
                  screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.02),
                _buildCircleButton(
                  context,
                  (){
                    Navigator.pop(context);
                  },
                  'assets/svg/phoneicon.svg',
                  red2Color,
                  screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.02),
                _buildCircleButton(
                  context,
                  (){},
                  'assets/svg/micicon.svg',
                  whiteColor,
                  screenWidth * 0.06,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(
      BuildContext context, VoidCallback onTap, String iconPath, Color bgColor, double size) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size * 0.9),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconPath,
          width: size,
          height: size,
          color: bgColor == whiteColor ? blackColor : whiteColor,
        ),
      ),
    );
  }
}
