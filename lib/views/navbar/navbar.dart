import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:happymindapp/app/style/style.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"icon": "assets/svg/home.svg", "title": "Home"},
      {"icon": "assets/svg/chat_1.svg", "title": "Messages"},
      {"icon": "assets/svg/doctors.svg", "title": "Doctors"},
      {"icon": "assets/svg/appointment.svg", "title": "Appointment"},
      {"icon": "assets/svg/search.svg", "title": "Search"},
      {"icon": "assets/svg/profile.svg", "title": "Profile"},
    ];

    return Container(
      height: 82,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: lightGreyColor,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  items[index]["icon"]!,
                  height: 22,
                  width: 22,
                  color: selectedIndex == index ? lightGreenColor : customGreyColor,
                ),
                const Gap(4),
                Text(
                  items[index]["title"]!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == index ? lightGreenColor : customGreyColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
