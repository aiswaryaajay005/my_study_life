import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class AcademicTab extends StatelessWidget {
  const AcademicTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Image.asset(ImageConstants.pnglogo, height: 100, width: 100),
      ],
    );
  }
}
