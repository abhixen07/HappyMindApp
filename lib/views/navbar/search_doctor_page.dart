import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happymindapp/app/customwidget/custom_text_field.dart';
import 'package:happymindapp/app/style/style.dart';
import 'package:happymindapp/views/navbar/widgets/doctor_widget.dart';

class SearchDoctorPage extends StatefulWidget {
  const SearchDoctorPage ({super.key});

  @override
  _SearchDoctorPageState createState() => _SearchDoctorPageState();
}

class _SearchDoctorPageState extends State<SearchDoctorPage> {
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
          .where((doctor) => doctor["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Doctors",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkGreenColor,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            /// Search Bar
            CustomTextFormField(
              controller: _searchController,
              onChanged: _filterDoctors,
              borderColor: Colors.transparent,
              borderWidth: 0,
              hintText: 'Search a Doctor',
              hintFontWeight: FontWeight.w400,
              fontSize: 16,
              hintTextColor: customGreyColor,
              noBorder: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset("assets/svg/search_field.svg"),
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            // Doctors List
            Expanded(
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
      ),
    );
  }
}
