import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';
import 'package:my_study_life/view/schedule_setup/academic_years.dart';

class ScheduleSetup extends StatefulWidget {
  const ScheduleSetup({super.key});

  @override
  State<ScheduleSetup> createState() => _ScheduleSetupState();
}

class _ScheduleSetupState extends State<ScheduleSetup> {
  int selectedType = 0;
  int? selectedDaysDisplay;
  int? selectedLetterIndex = -1;
  final List<String> daysOfWeek = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];
  int selectedDayIndex = -1;
  String? day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            ReusablebackButton(),
            SizedBox(width: 50),
            Text(
              "Schedule Setup",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Academic Year",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AcademicYears(),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(width: 15),
                      Text("Manage Academic Years"),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_down_outlined),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
              Text(
                "Schedule Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Classes Rotate according to the schedule day"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildSelectableContainer(
                      text: "Fixed",
                      isSelected: selectedType == 0,
                      onTap: () {
                        setState(() {
                          selectedType = 0;
                        });
                      },
                    ),
                    _buildSelectableContainer(
                      text: "Week Rotation",
                      isSelected: selectedType == 1,
                      onTap: () {
                        setState(() {
                          selectedType = 1;
                        });
                      },
                    ),
                    _buildSelectableContainer(
                      text: "Day Rotation",
                      isSelected: selectedType == 2,
                      onTap: () {
                        setState(() {
                          selectedType = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (selectedType == 0) ...[
                Text(
                  "First Day",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("What is the first day of your school week?"),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  focusColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Select a Day',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  items:
                      [
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday',
                        'Sunday',
                      ].map((day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day),
                        );
                      }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      day = value;
                    });
                  },
                ),
              ] else if (selectedType == 1) ...[
                Text(
                  "Number of weeks",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("How many weeks are in your schedule"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => _buildSelectableContainer(
                        text: (index + 1).toString(),
                        isSelected: selectedDaysDisplay == index,
                        onTap:
                            () => setState(() => selectedDaysDisplay = index),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Start Week",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("What is the first week of your schedule"),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => _buildSelectableContainer(
                        text: String.fromCharCode(65 + index),
                        isSelected: selectedLetterIndex == index,
                        onTap: () {
                          setState(() {
                            selectedLetterIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ] else if (selectedType == 2) ...[
                Text(
                  "Number of days",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => _buildSelectableContainer(
                        text: (index + 1).toString(),
                        isSelected: selectedDaysDisplay == index,
                        onTap:
                            () => setState(() => selectedDaysDisplay = index),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Start Day",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => _buildSelectableContainer(
                        text: String.fromCharCode(65 + index),
                        isSelected: selectedLetterIndex == index,
                        onTap: () {
                          setState(() {
                            selectedLetterIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Text("Days", style: TextStyle(fontWeight: FontWeight.bold)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      daysOfWeek.length,
                      (index) => _buildSelectableContainer(
                        text: daysOfWeek[index],
                        isSelected: selectedDayIndex == index,
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
              Text(
                "Default start time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("What tme does your school day start?"),

              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("8:00 am")),
              ),
              SizedBox(width: 25),
              Text("Duration*", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("How long are your classes?"),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("60 minutes")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectableContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    IconData? icons,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? Colors.blue.shade400 : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? Colors.blue : ColorConstants.buttonBlue,
                ),
              ),
            ),
            SizedBox(width: 5),
            Icon(icons, color: Colors.blue, size: 20),
          ],
        ),
      ),
    );
  }
}
