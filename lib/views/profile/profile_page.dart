import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:happymindapp/app/routes/app_routes.dart';
import 'package:happymindapp/app/style/style.dart';

import '../../viewmodel/login_view_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        // leading: IconButton(
        //     onPressed:(){
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor)),
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkGreenColor,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04, horizontal: screenWidth * 0.06),
        children: [
          Center(
            child: CircleAvatar(
              radius: screenWidth * 0.15,
              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/5.jpg"), // replace with your image path
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: Text(
              'John Doe William',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          _buildProfileOption(
            context,
            icon: Icons.history,
            label: "History",
          ),
          _buildProfileOption(
            context,
            icon: Icons.account_circle_outlined,
            label: "Personal Details",
          ),
          _buildProfileOption(
            context,
            icon: Icons.location_on_outlined,
            label: "Location",
          ),
          _buildProfileOption(
            context,
            icon: Icons.credit_card_outlined,
            label: "Payment Method",
          ),
          _buildProfileOption(
            context,
            icon: Icons.settings_outlined,
            label: "Settings",
          ),
          _buildProfileOption(
            context,
            icon: Icons.help_outline,
            label: "Help",
          ),
          _buildProfileOption(
            onPress: (){
              final loginViewModel = Get.put(LoginViewModel());
              loginViewModel.logoutUser(context);            },
            context,
            icon: Icons.logout,
            label: "Logout",

          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(
      BuildContext context, {
        required IconData icon,
        required String label,
        VoidCallback? onPress,
        Color iconColor = lightGreenColor,
        Color textColor = blackColor,
      }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.008),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.025),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: screenWidth * 0.06,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios_outlined, size: screenWidth * 0.04, color: customGreyColor,),
          ],
        ),
      ),
    );
  }
}
