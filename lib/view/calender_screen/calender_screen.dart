import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/calender_drawer_items.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
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
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(title: Text(""), backgroundColor: Colors.transparent),
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
                    boxFill: ColorConstants.darkclass,
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkExam,
                    boxColor: ColorConstants.lightExam,
                    boxFill: ColorConstants.darkExam,
                    title: "Exams",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkTasks,
                    boxColor: ColorConstants.lightTasks,
                    title: "Tasks",
                    boxFill: ColorConstants.darkTasks,
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    boxFill: ColorConstants.darkHolidays,
                    borderClr: ColorConstants.darkHolidays,
                    boxColor: ColorConstants.lightHolidays,
                    title: "Holidays",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    borderClr: ColorConstants.darkXtra,
                    boxColor: ColorConstants.lightXtra,
                    boxFill: ColorConstants.darkXtra,
                    title: "Xtra",
                  ),
                  SizedBox(height: 10),
                  CalendarDrawerItem(
                    boxFill: ColorConstants.darkIcals,
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
