import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class CalendarDrawerItem extends StatefulWidget {
  final Color boxColor;
  final Color? boxFill;
  final Color borderClr;
  final String title; // Added dynamic text

  const CalendarDrawerItem({
    super.key,
    required this.boxColor,
    required this.borderClr,
    required this.title,
    this.boxFill,
  });

  @override
  State<CalendarDrawerItem> createState() => _CalendarDrawerItemState();
}

class _CalendarDrawerItemState extends State<CalendarDrawerItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
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
                color:
                    isSelected
                        ? widget.boxFill ?? widget.boxColor
                        : widget.boxColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: widget.borderClr),
              ),
            ),
            SizedBox(width: 10),
            Text(widget.title),
            Spacer(),
            isSelected
                ? Icon(Icons.check_circle, color: Colors.blue)
                : Icon(Icons.circle_outlined, color: ColorConstants.lightblue3),
          ],
        ),
      ),
    );
  }
}
