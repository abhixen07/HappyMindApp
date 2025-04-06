import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happymindapp/app/customwidget/custom_text_field.dart';

import '../../app/style/style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
            onPressed:(){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor)),
        title: Text(
          "DR. Asim",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkGreenColor,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SvgPicture.asset('assets/svg/phoneicon.svg',color: blackColor,),
          ),
          Padding(
            padding: EdgeInsets.only(left:15,right: 25),
            child: SvgPicture.asset('assets/svg/videoicon.svg',color: blackColor,),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildReceiverMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                  _buildSenderMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                  _buildReceiverMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                  _buildSenderMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                  _buildSenderMessage("Rorem adipiscing elit.", screenWidth),
                  _buildReceiverMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                  _buildSenderMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                  _buildReceiverMessage("Rorem ipsum dolor sit  adipiscing elit.", screenWidth),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    noBorder: true,
                    borderWidth: 0,
                    borderColor: Colors.transparent,
                    hintText: "Write here",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/svg/smile.svg'),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                GestureDetector(
                  onTap: (){},
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: lightGreenColor,
                    child: Icon(Icons.send_rounded,color: Colors.white,),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiverMessage(String message, double screenWidth) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(
          vertical: 11,
          horizontal: screenWidth * 0.04,
        ),
        decoration: BoxDecoration(
          color: lightGreyColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(fontSize: screenWidth * 0.033,fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildSenderMessage(String message, double screenWidth) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(
          vertical: 11,
          horizontal: screenWidth * 0.04,
        ),
        decoration: BoxDecoration(
          color: lightGreenColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: screenWidth * 0.033,
            fontWeight: FontWeight.w500,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
