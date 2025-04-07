import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happymindapp/app/style/style.dart';

class MessageCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String name;
  final String imageUrl;
  final String message;
  final String time;

  const MessageCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.name,
    required this.imageUrl,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: lightGreenColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.025),
        child: Row(
          children: [
            // Profile picture with a slight round border
            CircleAvatar(
              radius: screenWidth * 0.09,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: screenWidth * 0.04),
            // Name, time, and message details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  // Message Text
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                      color: customGreyColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
