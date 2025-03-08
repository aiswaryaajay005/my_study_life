import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/calender_drawer_items.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarController _calendarController = CalendarController();

  void _changeCalendarView(CalendarView view) {
    setState(() {
      _calendarController.view = view;
    });
    Navigator.pop(context); // Close the drawer after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(title: Text("Calendar View")),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 40),
            ListTile(
              leading: Icon(Icons.calendar_view_day),
              title: Text('Day'),
              onTap: () => _changeCalendarView(CalendarView.day),
            ),
            ListTile(
              leading: Icon(Icons.calendar_view_week),
              title: Text('Week'),
              onTap: () => _changeCalendarView(CalendarView.week),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Month'),
              onTap: () => _changeCalendarView(CalendarView.month),
            ),

            // ListTile(
            //   leading: Icon(Icons.calendar_view_month),
            //   title: Text('Schedule View'),
            //   onTap: () => _changeCalendarView(CalendarView.schedule),
            // ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkclass,
                    boxColor: Colors.green.shade50,
                    title: "Classes",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkExam,
                    boxColor: ColorConstants.lightExam,
                    title: "Exams",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkTasks,
                    boxColor: ColorConstants.lightTasks,
                    title: "Tasks",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkHolidays,
                    boxColor: ColorConstants.lightHolidays,
                    title: "Holidays",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkXtra,
                    boxColor: ColorConstants.lightXtra,
                    title: "Xtra",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkIcals,
                    boxColor: ColorConstants.lightIcals,
                    title: "ICal",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SfCalendar(
        controller: _calendarController,
        view: CalendarView.day,
        showNavigationArrow: true,
        headerHeight: 50,
        headerStyle: CalendarHeaderStyle(
          backgroundColor: ColorConstants.lightGrey,
          textAlign: TextAlign.center,
          textStyle: TextStyle(backgroundColor: Colors.white, fontSize: 20),
        ),
        showTodayButton: true,
        cellEndPadding: 2,
      ),
    );
  }
}
