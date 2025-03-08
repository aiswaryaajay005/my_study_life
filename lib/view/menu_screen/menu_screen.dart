import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/ai_schedule_screen/ai_schedule_screen.dart';
import 'package:my_study_life/view/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:my_study_life/view/classes_screen/classes_screen.dart';
import 'package:my_study_life/view/exams_screen/exams_screen.dart';
import 'package:my_study_life/view/focus_timer_screen/focus_timer_screen.dart';
import 'package:my_study_life/view/ical_connect_screen/ical_connect_screen.dart';
import 'package:my_study_life/view/settings_screen/settings_screen.dart';
import 'package:my_study_life/view/task_screen/task_screen.dart';
import 'package:my_study_life/view/vacation_screen/vacation_screen.dart';
import 'package:my_study_life/view/xtra_screen/xtra_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Map<String, dynamic>> menuItems = [
    {"icon": ImageConstants.taskIcon, "name": "Tasks"},
    {"icon": ImageConstants.classIcon, "name": "Classes"},
    {"icon": ImageConstants.examIcon, "name": "Exams"},
    {"icon": ImageConstants.vacationIcon, "name": "Vacation"},
    {"icon": ImageConstants.xtraIcon, "name": "Xtra"},
    {"icon": ImageConstants.timerIcon, "name": "Focus Timer"},
    {"icon": ImageConstants.aiIcon, "name": "AI Schedule"},
    {"icon": ImageConstants.icalIcon, "name": "iCal Connect"},
    {"icon": ImageConstants.settingsIcon, "name": "Settings"},
  ];

  List pages = [
    TaskScreen(),
    ClassesScreen(),
    ExamsScreen(),
    VacationScreen(),
    XtraScreen(),
    FocusTimerScreen(),
    AiScheduleScreen(),
    IcalConnectScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text(
              "Menu",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            GridView.builder(
              padding: EdgeInsets.all(40),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                crossAxisCount: 3,
              ),
              itemCount: menuItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pages[index]),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          menuItems[index]['icon']!,
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          menuItems[index]['name']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
