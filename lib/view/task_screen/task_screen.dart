import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_screens.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/view/task_screen/tabs/current_tab.dart';
import 'package:my_study_life/view/task_screen/tabs/overdue_tab.dart';
import 'package:my_study_life/view/task_screen/tabs/past_tab.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreens(
      length: 3,
      screens: [CurrentTab(), PastTab(), OverdueTab()],
      tabNames: ["Current", "Past", "Overdue"],
      titleText: "Tasks",
    );
  }
}
