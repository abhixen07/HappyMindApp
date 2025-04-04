import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happymindapp/app/style/style.dart';

import '../../app/routes/app_routes.dart';

class PaymentDonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.1), // Top spacing

          ///Success Icon
          CircleAvatar(
            radius: height * 0.1, // Dynamic size
            backgroundColor: lightGreenColor.withOpacity(0.5),
            child: Icon(
              Icons.check,
              color: whiteColor,
              size: height * 0.12,
            ),
          ),

          SizedBox(height: height * 0.04), // Spacing

          // Success Message
          Text(
            "Congratulations",
            style: TextStyle(
              fontSize: width * 0.08,
              fontWeight: FontWeight.bold,
              color: darkGreenColor,
            ),
          ),

          SizedBox(height: height * 0.01),

          Text(
            "Your Payment Is Successful",
            style: TextStyle(
              fontSize: width * 0.04,
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: height * 0.2), // Spacing before button

          // Back Button
          Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
              child: TextButton(onPressed: (){
                GoRouter.of(context).pushNamed(NamedRoutes.loginpage.name);
              }, child: Text('Back'))),
        ],
      ),
    );
  }
}
