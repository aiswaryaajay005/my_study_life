import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class NewYear extends StatefulWidget {
  const NewYear({super.key});

  @override
  State<NewYear> createState() => _NewYearState();
}

class _NewYearState extends State<NewYear> {
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
              "New Academic Year",
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
            spacing: 15,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Date*",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("Fri, 4 Mar 2022")),
                      ),
                    ],
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End  Date*",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("Fri, 4 Mar 2022")),
                      ),
                    ],
                  ),
                ],
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
              if (selectedType == 1) ...[
                Text(
                  "Number of weeks",
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
                  "Start Week",
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
              Text("Terms", style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: EdgeInsets.all(5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.buttonBlue),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(
                  children: [
                    Text(
                      " Add New Term",
                      style: TextStyle(color: ColorConstants.lightGrey1),
                    ),
                    Spacer(),
                    Icon(Icons.add),
                  ],
                ),
              ),
              Text(
                "What are academic years?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "An academic year is used to represent your school year and any terms (eg.semesters, trimeseters, winter///0 that you may have)",
              ),
              Row(
                children: [
                  CustomButton(
                    buttonText: "Cancel",
                    onButtonPressed: () {
                      Navigator.of(context);
                    },
                    cWidth: 150,
                    bgColor: ColorConstants.lightblue,
                    textColor: ColorConstants.buttonBlue,
                  ),
                  Spacer(),
                  CustomButton(
                    buttonText: "Save",
                    onButtonPressed: () {},

                    cWidth: 150,
                  ),
                ],
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

  Row _buildCancelOkButton(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          buttonText: "Cancel",
          bgColor: ColorConstants.lightGrey,
          textColor: ColorConstants.buttonBlue,
          cWidth: 150,
          onButtonPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    alignment: Alignment.bottomCenter,
                    title: Text("Are you sure"),

                    actions: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              buttonText: "No",
                              onButtonPressed: () {
                                Navigator.pop(context);
                              },
                              bgColor: ColorConstants.lightblue,
                              textColor: ColorConstants.buttonBlue,
                              cWidth: 150,
                            ),
                            SizedBox(height: 10),
                            CustomButton(
                              buttonText: "Yes",
                              onButtonPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },

                              cWidth: 150,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            );
          },
        ),
        Spacer(),
        CustomButton(
          cWidth: 150,
          buttonText: "Save Exam",
          onButtonPressed: () {},
        ),
      ],
    );
  }
}
