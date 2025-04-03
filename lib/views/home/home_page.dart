import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:happymindapp/app/style/style.dart';

import '../../app/customwidget/custom_text_field.dart';
import '../navbar/widgets/doctor_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr.Asim",
      "description": "Expert in Cardiology with 10 years of experience.",
      "imageUrl": "https://randomuser.me/api/portraits/men/1.jpg",
      "rating": 5.0,
    },
    {
      "name": "Dr.Shasta",
      "description": "Specialist in Neurology and Brain Health.",
      "imageUrl": "https://randomuser.me/api/portraits/women/1.jpg",
      "rating": 4.8,
    },
    {
      "name": "Dr.Ahmed",
      "description": "Leading Pediatrician with 15 years of experience.",
      "imageUrl": "https://randomuser.me/api/portraits/men/2.jpg",
      "rating": 4.9,
    },
    {
      "name": "Dr.Ali",
      "description": "Expert in Cardiology with 10 years of experience.",
      "imageUrl": "https://randomuser.me/api/portraits/men/4.jpg",
      "rating": 5.0,
    },
  ];

  List<Map<String, dynamic>> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors;
  }

  void _filterDoctors(String query) {
    setState(() {
      filteredDoctors = doctors
          .where((doctor) =>
              doctor["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Dr. Ali",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: blackColor)),
            Text("ISB", style: TextStyle(fontSize: 12, color: greyColor)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/svg/notification icon.svg',
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        children: [
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: CustomTextFormField(
                  fillColor: Colors.transparent,
                  controller: _searchController,
                  onChanged: _filterDoctors,
                  borderColor: Colors.transparent,
                  borderWidth: 1,
                  hintText: 'Search...',
                  hintFontWeight: FontWeight.w400,
                  fontSize: 16,
                  hintTextColor: customGreyColor,
                  noBorder: true,
                  height: 50,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset("assets/svg/search_field.svg"),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: customGreyColor)
                  ),
                  child:  CircleAvatar(
                    //radius: 25,
                    backgroundColor: whiteColor,
                    child: SvgPicture.asset('assets/svg/scanner.svg',height: 25,width: 25,
                        ),
                  ),
                ),
              )


            ],
          ),

          SizedBox(height: 16),

          // Action Cards
          Row(
            children: [
              Expanded(
                child: _buildActionCard("Book Appointment",
                    'https://randomuser.me/api/portraits/men/4.jpg'),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _buildActionCard("Instant Video Consult",
                    'https://randomuser.me/api/portraits/men/1.jpg'),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Categories
          Text("Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildCategories(),

          SizedBox(height: 16),

          // Doctors List
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("All Doctors",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("View all >", style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 8),
          // Doctors List
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                return DoctorCard(
                  doctorName: filteredDoctors[index]["name"],
                  description: filteredDoctors[index]["description"],
                  imageUrl: filteredDoctors[index]["imageUrl"],
                  rating: filteredDoctors[index]["rating"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, String imagePath) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.network(imagePath, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    List<Map<String, dynamic>> categories = [
      {"icon": 'assets/svg/eyeIcon.svg', "title": "Eye Specialist"},
      {"icon": 'assets/svg/dentistIcon.svg', "title": "Dentist"},
      {"icon": 'assets/svg/cadiologistIcon.svg', "title": "Cardiologist"},
      {"icon": 'assets/svg/pulmonogistIcon.svg', "title": "Pulmonologist"},
      {"icon": 'assets/svg/pulmonogistIcon.svg', "title": "Pulmonologist"},
      {"icon": 'assets/svg/pulmonogistIcon.svg', "title": "Pulmonologist"},
    ];

    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green.withOpacity(0.1),
                  child: SvgPicture.asset(categories[index]["icon"],
                      color: Colors.green),
                ),
                SizedBox(height: 5),
                Text(categories[index]["title"],
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
