import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reuable_subject_field.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class CurrentTab extends StatelessWidget {
  const CurrentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        ReusableSubjectField(),
        SizedBox(height: 30),
        Image.asset(ImageConstants.pnglogo, height: 100, width: 100),
        Text("Add exam"),
      ],
    );
  }
}
