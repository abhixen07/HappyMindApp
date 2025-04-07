import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:happymindapp/app/routes/app_routes.dart';

import '../../app/style/style.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  String selectedTime = "11.00 AM";
  String selectedDate = "Sun 4";

  List<String> timeSlots = ["10.00 AM", "11.00 AM", "12.00 PM"];
  List<String> dates = ["Sun 4", "Mon 5", "Tue 6"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment",
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
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05,vertical: width*0.05),

        children: [
          /// Doctor Profile
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network("https://randomuser.me/api/portraits/men/4.jpg",
                    width: width * 0.2, height: width * 0.25,fit: BoxFit.cover,),
              ),
              SizedBox(width: width * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    children: [
                      Text("Dr. Asim",
                          style: TextStyle(
                            color: darkGreenColor,
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold)),
                      SizedBox(width: width * 0.05),

                      Row(
                        children: [

                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(NamedRoutes.chatpage.name);
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: lightGreenColor.withOpacity(0.21),
                              child: SvgPicture.asset('assets/svg/chat_1.svg',
                                color: darkGreenColor,),
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          GestureDetector(
                            onTap: (){
                              GoRouter.of(context).pushNamed(NamedRoutes.callpage.name);
                            },
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: lightGreenColor.withOpacity(0.21),
                              child: SvgPicture.asset('assets/svg/phoneicon.svg',
                                  color:darkGreenColor,),
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: lightGreenColor.withOpacity(0.21),
                            child: SvgPicture.asset('assets/svg/videoicon.svg',
                                color: darkGreenColor),
                          ),


                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.006),
                  Text("Denteeth",
                      style: TextStyle(fontSize: width * 0.04, color: darkGreenColor.withOpacity(0.5))),
                  SizedBox(height: height * 0.025),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Payment",
                          style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w600,
                              color: darkGreenColor)),

                      SizedBox(width: height * 0.12),

                      Text("RS. 1500",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: darkGreenColor.withOpacity(0.5))),
                    ],
                  ),

                ],
              ),

            ],
          ),
          SizedBox(height: height * 0.04),

          // Details
          Text("Details",
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: height * 0.01),
          Text(
            textAlign: TextAlign.justify,
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque"
                ". Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
            style: TextStyle(fontSize: width * 0.04, color: greyColor,),
          ),
          SizedBox(height: height * 0.04),

          /// Working Hours
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Working Hours',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(fontSize: 14, color: blackColor),
              )
            ],
          ),
          SizedBox(height: height * 0.015),
          SizedBox(
            height: height * 0.06, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                String time = timeSlots[index];
                bool isSelected = time == selectedTime;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? lightGreenColor : lightGreyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center( // Center text properly
                      child: Text(
                        time,
                        style: TextStyle(
                            color: isSelected ? whiteColor : blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: height * 0.03),

          // Date Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(fontSize: 14, color: blackColor),
              )
            ],
          ),
          SizedBox(height: height * 0.015),
          SizedBox(
            height: height * 0.06, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                String date = dates[index];
                bool isSelected = date == selectedDate;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? lightGreenColor : lightGreyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        date,
                        style: TextStyle(
                            color: isSelected ? whiteColor : blackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: height * 0.05),

          /// Book an Appointment Button
          TextButton(onPressed: (){
            GoRouter.of(context).pushNamed(NamedRoutes.selectimepage.name);
          }, child: Text('Book an Appointment')),
        ],
      ),
    );
  }
}
