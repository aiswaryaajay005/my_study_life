import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_screens.dart';
import 'package:my_study_life/view/classes_screen/tabs/current_tab.dart';
import 'package:my_study_life/view/classes_screen/tabs/past_tab.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreens(
      length: 2,
      titleText: "Classes",
      tabNames: ["Current", "Past"],
      screens: [CurrentTab(), PastTab()],
    );
  }
}
