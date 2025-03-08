import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class CalendarDrawerItem extends StatefulWidget {
  final Color boxColor;
  final Color borderClr;
  final String title; // Added dynamic text

  const CalendarDrawerItem({
    super.key,
    required this.boxColor,
    required this.borderClr,
    required this.title, // Accept title dynamically
  });

  @override
  State<CalendarDrawerItem> createState() => _CalendarDrawerItemState();
}

class _CalendarDrawerItemState extends State<CalendarDrawerItem> {
  bool isSelected = false; // Toggle state

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle state
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50, // Increased for better touch area
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? ColorConstants.selectBlue : Colors.white,
          ),
          color: isSelected ? ColorConstants.lightblue1 : Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: widget.boxColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: widget.borderClr),
              ),
            ),
            SizedBox(width: 10),
            Text(widget.title), // Now dynamic
            Spacer(),
            isSelected
                ? Icon(Icons.check_circle, color: Colors.blue)
                : Icon(Icons.circle_outlined, color: ColorConstants.lightblue3),
            // Adds checkmark when selected
          ],
        ),
      ),
    );
  }
}
