import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_screens.dart';
import 'package:my_study_life/view/xtra_screen/tabs/academic_tab.dart';
import 'package:my_study_life/view/xtra_screen/tabs/non_academic_tab.dart';

class XtraScreen extends StatelessWidget {
  const XtraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreens(
      length: 2,
      titleText: "Xtra",
      tabNames: ["Academic", "Non-Academic"],
      screens: [AcademicTab(), NonAcademicTab()],
    );
  }
}
