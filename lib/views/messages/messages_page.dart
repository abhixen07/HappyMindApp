import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happymindapp/views/messages/widgets/messages_widget.dart';
import '../../app/customwidget/custom_text_field.dart';
import '../../app/style/style.dart';


class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // Sample list of doctor messages
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr.Upul",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "message": "Hi, I would like to discuss your test results."
    },
    {
      "name": "Dr.Silva",
      "image": "https://randomuser.me/api/portraits/women/1.jpg",
      "message": "Your appointment is confirmed for tomorrow."
    },
    {
      "name": "Dr.Alex",
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
      "message": "Please call me back when you have time."
    },
    {
      "name": "Dr.Alex",
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
      "message": "Please call me back when you have time."
    },
    {
      "name": "Dr.Alex",
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
      "message": "Please call me back when you have time."
    },
  ];

  late List<Map<String, dynamic>> filteredDoctors;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors;
  }

  // Search filter as provided
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkGreenColor,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios_new_outlined, color: blackColor),
        //   onPressed: () {},
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04,vertical: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom search field using SVG icon
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
            SizedBox(height: screenHeight * 0.04),
            // List of messages/cards
            Text("Active Now",
                style: TextStyle(
                  letterSpacing: 0,
                    fontSize: 22, fontWeight: FontWeight.w700)),
            SizedBox(height: screenHeight*0.02),
            _buildActiveNowList(),
            // List of messages/cards
            Text("Messages",
                style: TextStyle(
                    letterSpacing: 0,
                    fontSize: 22, fontWeight: FontWeight.w700)),
            SizedBox(height: screenHeight*0.03),

            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  return MessageCard(
                    time: "10:30",
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    name: doctor["name"],
                    imageUrl: doctor["image"],
                    message: doctor["message"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildActiveNowList() {
    List<String> profileImages = [
      'https://randomuser.me/api/portraits/men/2.jpg',
      'https://randomuser.me/api/portraits/men/6.jpg',
      'https://randomuser.me/api/portraits/men/16.jpg',
      'https://randomuser.me/api/portraits/men/28.jpg',
      'https://randomuser.me/api/portraits/men/66.jpg',
      'https://randomuser.me/api/portraits/men/58.jpg',
      'https://randomuser.me/api/portraits/men/19.jpg',

    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: profileImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(profileImages[index]),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      color: greenIndicatorColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
