import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_screens.dart';
import 'package:my_study_life/view/vacation_screen/tabs/past_tab.dart';
import 'package:my_study_life/view/vacation_screen/tabs/upcoming_tab.dart';

class VacationScreen extends StatelessWidget {
  const VacationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreens(
      length: 2,
      titleText: "Vacations",
      tabNames: ["Upcoming", "Past"],
      screens: [UpcomingTab(), PastTab()],
    );
  }
}
