import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reuable_subject_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class OverdueTab extends StatefulWidget {
  const OverdueTab({super.key});

  @override
  State<OverdueTab> createState() => _OverdueTabState();
}

class _OverdueTabState extends State<OverdueTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ReusableSubjectField(),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Overdue",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Mark all as complete",
                style: TextStyle(
                  color: ColorConstants.darkestBlue3,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
