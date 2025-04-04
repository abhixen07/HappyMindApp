import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../app/routes/app_routes.dart';
import '../../app/style/style.dart';

class SelectDateTimePage extends StatefulWidget {
  const SelectDateTimePage({super.key});

  @override
  _SelectDateTimePageState createState() => _SelectDateTimePageState();
}


class _SelectDateTimePageState extends State<SelectDateTimePage> {
  DateTime _selectedDay = DateTime.now();

  List<String> timeSlots = ["10.00 AM", "11.00 AM", "12.00 PM"];
  String selectedTime = "11.00 AM";

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Date and Time",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: darkGreenColor,
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: darkGreenColor),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.02),
            // Month Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_outlined, size: 16),
                      onPressed: () {
                        setState(() {
                          _selectedDay = DateTime(
                            _selectedDay.year,
                            _selectedDay.month - 1,
                            1,
                          );
                        });
                      },
                    ),
                    Text(
                      _getMonthName(_selectedDay),
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined, size: 16),
                      onPressed: () {
                        setState(() {
                          _selectedDay = DateTime(
                            _selectedDay.year,
                            _selectedDay.month + 1,
                            1,
                          );
                        });
                      },
                    ),
                  ],
                ),
                // Year
                Text(
                  '${_selectedDay.year}',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: lightGreenColor),
                ),
                SizedBox(width: 20),

              ],
            ),
            SizedBox(height: 10),

            // Calendar Widget
            TableCalendar(
              focusedDay: _selectedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              calendarFormat: CalendarFormat.month,
              headerVisible: false,
              startingDayOfWeek: StartingDayOfWeek.monday,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: lightGreenColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: lightGreenColor,
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: blackColor),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Time Slot',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 14, color: blackColor),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              height: screenHeight * 0.06, // Adjust height as needed
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
            SizedBox(height: screenHeight*0.12,),
            Row(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    'assets/svg/chat.svg',
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: TextButton(
                    onPressed: () {
                      GoRouter.of(context).pushNamed(NamedRoutes.paymentdonepage.name);
                    },
                    child:
                        Text(
                          'Set Appointment',
                    ),
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

  // Function to Get Month Name (Fix for Month Display)
  String _getMonthName(DateTime date) {
    List<String> months = [
      "January", "February", "March", "April", "May", "June", "July",
      "August", "September", "October", "November", "December"
    ];
    return months[date.month - 1]; // Correctly returns the month name
  }


}
