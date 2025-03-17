import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reuable_subject_field.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class CurrentTab extends StatefulWidget {
  const CurrentTab({super.key});

  @override
  State<CurrentTab> createState() => _CurrentTabState();
}

class _CurrentTabState extends State<CurrentTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ReusableSubjectField(),
        SizedBox(height: 30),
        Image.asset(ImageConstants.pnglogo, height: 100, width: 100),
        Text("Add Task"),
      ],
    );
  }
}
