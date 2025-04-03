import 'package:flutter/material.dart';
import 'package:happymindapp/views/navbar/doctor_page.dart';
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
    Center(child: Text("Home Page")),
    Center(child: Text("Search Page")),
    // Center(child: Text("Doctors Page")),
    DoctorsPage(),
    Center(child: Text("Appointment Page")),
    Center(child: Text("Profile Page")),
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
