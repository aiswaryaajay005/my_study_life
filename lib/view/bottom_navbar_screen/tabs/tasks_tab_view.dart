import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';

class TasksTabView extends StatefulWidget {
  const TasksTabView({super.key});

  @override
  State<TasksTabView> createState() => _TasksTabViewState();
}

class _TasksTabViewState extends State<TasksTabView> {
  int? selectedSubject = 1;
  int? selectedType = 1;
  int? selectedOccurs = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubjects(),
            SizedBox(height: 5),
            Text("Title *", style: TextStyle(fontWeight: FontWeight.bold)),
            ReusableFormField(hintText: "Task Title", rad: 10),
            SizedBox(height: 5),
            Text("Details", style: TextStyle(fontWeight: FontWeight.bold)),
            ReusableFormField(
              hintText: "Task Description",
              maxLines: 3,
              rad: 10,
            ),
            SizedBox(height: 5),
            Text("Type *", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                _buildSelectableContainer(
                  text: "Assignment",
                  isSelected: selectedType == 0,
                  onTap:
                      () => setState(() {
                        selectedType = 0;
                      }),
                ),
                _buildSelectableContainer(
                  text: "Reminder",
                  isSelected: selectedType == 1,
                  onTap:
                      () => setState(() {
                        selectedType = 1;
                      }),
                ),
                _buildSelectableContainer(
                  text: "Revision",
                  isSelected: selectedType == 2,
                  onTap:
                      () => setState(() {
                        selectedType = 2;
                      }),
                ),
              ],
            ),
            Row(
              children: [
                _buildSelectableContainer(
                  text: "Essay",
                  icons: Symbols.crown,
                  isSelected: selectedType == 3,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PremiumSubscription(),
                      ),
                    );
                  },
                ),
                _buildSelectableContainer(
                  text: "Group Project",
                  icons: Symbols.crown,
                  isSelected: selectedType == 4,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PremiumSubscription(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                _buildSelectableContainer(
                  text: "Reading",
                  icons: Symbols.crown,
                  isSelected: selectedType == 5,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PremiumSubscription(),
                      ),
                    );
                  },
                ),
                _buildSelectableContainer(
                  text: "Meeting",
                  icons: Symbols.crown,
                  isSelected: selectedType == 6,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PremiumSubscription(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 5),
            Text("Occurs *", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                _buildSelectableContainer(
                  text: "Once",
                  isSelected: selectedOccurs == 0,
                  onTap:
                      () => setState(() {
                        selectedOccurs = 0;
                      }),
                ),
                _buildSelectableContainer(
                  text: "Repeating",
                  icons: Symbols.crown,
                  isSelected: selectedOccurs == 1,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PremiumSubscription(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 5),
            Text("Due Date*", style: TextStyle(fontWeight: FontWeight.bold)),
            ReusableFormField(hintText: "Fri, 4 Mar 2025", rad: 10),
            SizedBox(height: 5),
            Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
            ReusableFormField(hintText: "10:30 AM", rad: 10),
            SizedBox(height: 10),
            _buildCancelOkButton(context),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Subject *", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            _buildSelectableContainer(
              text: "English",
              isSelected: selectedSubject == 0,
              onTap: () => setState(() => selectedSubject = 0),
            ),
            _buildSelectableContainer(
              text: "Mathematics",
              isSelected: selectedSubject == 1,
              onTap: () => setState(() => selectedSubject = 1),
            ),
            _buildSelectableContainer(
              text: "Science",
              isSelected: selectedSubject == 2,
              onTap: () => setState(() => selectedSubject = 2),
            ),
          ],
        ),
        Row(
          children: [
            _buildSelectableContainer(
              text: "Biology",
              isSelected: selectedSubject == 3,
              onTap: () => setState(() => selectedSubject = 3),
            ),
            _buildSelectableContainer(
              text: "Chemistry",
              isSelected: selectedSubject == 4,
              onTap: () => setState(() => selectedSubject = 4),
            ),
            _buildSelectableContainer(
              text: "Physics",
              isSelected: selectedSubject == 5,
              onTap: () => setState(() => selectedSubject = 5),
            ),
          ],
        ),
        Row(
          children: [
            _buildSelectableContainer(
              text: "Music",
              isSelected: selectedSubject == 6,
              onTap: () => setState(() => selectedSubject = 6),
            ),
            _buildSelectableContainer(
              text: "Geography",
              isSelected: selectedSubject == 7,
              onTap: () => setState(() => selectedSubject = 7),
            ),
            _buildSelectableContainer(
              text: "History",
              isSelected: selectedSubject == 8,
              onTap: () => setState(() => selectedSubject = 8),
            ),
          ],
        ),
        Row(
          children: [
            _buildSelectableContainer(
              text: "Computer Science",
              isSelected: selectedSubject == 9,
              onTap: () => setState(() => selectedSubject = 9),
            ),
          ],
        ),
      ],
    );
  }
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
        buttonText: "Save Task",
        onButtonPressed: () {},
      ),
    ],
  );
}
