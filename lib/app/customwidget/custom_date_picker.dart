// import 'package:flutter/material.dart';
//
// import '../style/style.dart';
//
// class BottomSheetDatePicker {
//   static Future<void> show({
//     required BuildContext context,
//     required Function(DateTime) onDateSelected,
//     DateTime? initialDate,
//     DateTime? firstDate,
//     DateTime? lastDate,
//     Color? primaryColor,
//     Color? backgroundColor,
//   }) async {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height * 0.5,
//           decoration: BoxDecoration(
//             color: backgroundColor ?? whiteColor,
//             borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(16),
//             ),
//           ),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Theme(
//                   data: Theme.of(context).copyWith(
//                     colorScheme: Theme.of(context).colorScheme.copyWith(
//                       primary: primaryColor ?? btnColor, /// Primary color for selected dates and controls
//                       onPrimary: whiteColor, /// Color for text/icons on primary buttons
//                       surface: backgroundColor ?? whiteColor, /// Background color for calendar
//                       onSurface: whiteColor, /// Text color for dates, month, etc.
//                     ),
//                     textTheme: const TextTheme(
//                     headlineSmall: TextStyle(
//                       color: whiteColor, /// Month title color
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                     labelLarge: TextStyle(
//                       color: whiteColor, /// `<` and `>` buttons
//                     ),
//                     bodyLarge: TextStyle(
//                       color: whiteColor, /// Weekday labels color
//                       fontSize: 14,
//                     ),
//                     bodyMedium: TextStyle(
//                       color: whiteColor, /// Dates color
//                       fontSize: 14,
//                     ),
//                     bodySmall: TextStyle(
//                       color: whiteColor, /// Year picker dropdown (e.g., 2019, 2020)
//                       fontSize: 14,
//                     ),
//                   ),
//
//                     textButtonTheme: TextButtonThemeData(
//                       style: TextButton.styleFrom(
//                         iconColor: whiteColor,
//                         foregroundColor: whiteColor, /// Color for `<` and `>` buttons
//                       ),
//                     ),
//                   ),
//                   child: CalendarDatePicker(
//                     initialDate: initialDate ?? DateTime.now(),
//                     firstDate: firstDate ?? DateTime(1900),
//                     lastDate: lastDate ?? DateTime.now(),
//                     onDateChanged: (selectedDate) {
//                       onDateSelected(selectedDate);
//                     },
//                   ),
//                 ),
//               ),
//               const Divider(height: 1),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomButton(
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         title: 'Cancel',
//                         borderColor: whiteColor,
//                         buttonColor: Colors.transparent,
//                         textColor: whiteColor,
//                         onPress: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       CustomButton(
//                         width: MediaQuery.of(context).size.width * 0.35,
//                         title: 'OK',
//                         onPress: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
