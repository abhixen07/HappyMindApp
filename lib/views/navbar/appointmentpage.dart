import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:happymindapp/app/routes/app_routes.dart';

import '../../app/style/style.dart';
import '../../viewmodel/book_appointment_view_model.dart';

class AppointmentPage extends StatelessWidget {
  final AppointmentViewModel viewModel = Get.put(AppointmentViewModel());

  final List<String> timeSlots = ["10.00 AM", "11.00 AM", "12.00 PM"];
  final List<String> dates = ["Sun 4", "Mon 5", "Tue 6"];

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
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: width * 0.05,
        ),
        children: [
          /// Doctor Profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://randomuser.me/api/portraits/men/4.jpg",
                  width: width * 0.2,
                  height: width * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: width * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dr. Asim",
                          style: TextStyle(
                            color: darkGreenColor,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(NamedRoutes.chatpage.name);
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: lightGreenColor.withOpacity(0.21),
                            child: SvgPicture.asset(
                              'assets/svg/chat_1.svg',
                              color: darkGreenColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.006),
                    Text(
                      "Denteeth",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: darkGreenColor.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(height: height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: darkGreenColor,
                          ),
                        ),
                        Text(
                          "RS. 1500",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: darkGreenColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.04),

          /// Details Section
          Text(
            "Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height * 0.01),
          Text(
            textAlign: TextAlign.justify,
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis...",
            style: TextStyle(
              fontSize: width * 0.04,
              color: greyColor,
            ),
          ),
          SizedBox(height: height * 0.04),

          /// Time Slots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Working Hours',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('See All',
                  style: TextStyle(fontSize: 14, color: blackColor)),
            ],
          ),
          SizedBox(height: height * 0.015),
          SizedBox(
            height: height * 0.06,
            child:  ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                String time = timeSlots[index];
                bool isSelected = time == viewModel.selectedTime.value;

                return GestureDetector(
                  onTap: () => viewModel.setSelectedTime(time),
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? lightGreenColor
                          : lightGreyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        time,
                        style: TextStyle(
                          color: isSelected ? whiteColor : blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.03),

          /// Date Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('See All',
                  style: TextStyle(fontSize: 14, color: blackColor)),
            ],
          ),
          SizedBox(height: height * 0.015),
          SizedBox(
            height: height * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                String date = dates[index];
                bool isSelected = date == viewModel.selectedDate.value;

                return GestureDetector(
                  onTap: () => viewModel.setSelectedDate(date),
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? lightGreenColor
                          : lightGreyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        date,
                        style: TextStyle(
                          color: isSelected ? whiteColor : blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
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
          Obx(() => ElevatedButton(
            onPressed: viewModel.loading.value
                ? null
                : () {
              viewModel.bookAppointment(
                doctorName: "Dr. Asim",
                date: viewModel.selectedDate.value,
                slot: viewModel.selectedTime.value,
                userId: "123", // Replace with actual user ID
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: darkGreenColor,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: viewModel.loading.value
                ? CircularProgressIndicator(color: whiteColor)
                : Text(
              "Book an Appointment",
              style: TextStyle(color: whiteColor, fontSize: 16),
            ),
          )),
        ],
      ),
    );
  }
}
