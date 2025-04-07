import 'package:flutter/material.dart';
import 'package:happymindapp/views/messages/messages_page.dart';
import 'package:happymindapp/views/navbar/selectdatetimepage.dart';
import 'package:happymindapp/views/home/home_page.dart';
import 'package:happymindapp/views/navbar/appointmentpage.dart';
import 'package:happymindapp/views/navbar/doctor_page.dart';
import 'package:happymindapp/views/navbar/search_doctor_page.dart';
import 'package:happymindapp/views/profile/profile_page.dart';
import 'navbar.dart';

class NavBarHomePage extends StatefulWidget {
  const NavBarHomePage({super.key});

  @override
  _NavBarHomePageState createState() => _NavBarHomePageState();
}

class _NavBarHomePageState extends State<NavBarHomePage> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    // SearchDoctorPage(),
    MessagePage(),
    DoctorsPage(),
    AppointmentPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Change page based on selected index
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
