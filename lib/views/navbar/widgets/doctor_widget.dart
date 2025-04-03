import 'package:flutter/material.dart';

import '../../../app/style/style.dart';

class DoctorCard extends StatefulWidget {
  final String doctorName;
  final String description;
  final String imageUrl;
  final double rating;

  const DoctorCard({
    super.key,
    required this.doctorName,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  @override
  _DoctorCardState createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: lightGreenColor.withOpacity(0.07),
        borderRadius: BorderRadius.circular(12),

      ),
      child: Row(
        children: [
          // Doctor Image
          Container(
            width: screenWidth * 0.27,
            height: screenHeight * 0.14,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: screenWidth*0.06),

          // Doctor Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Doctor Name
                    Text(
                      widget.doctorName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Favorite Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? lightGreenColor : lightGreenColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.016),

                // Description
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    color: customGreyColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenHeight*0.01),

                // Book Button and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: ButtonStyle().copyWith(
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        ),

                        textStyle: const WidgetStatePropertyAll(
                          TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),

                        ///for size on screen
                        minimumSize: WidgetStatePropertyAll(
                            Size(MediaQuery.sizeOf(context).width*0.1, 30)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {},

                      child: Text(
                        "Book",
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: amberColor, size: 20),
                        SizedBox(width: 4),
                        Text(
                          widget.rating.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
