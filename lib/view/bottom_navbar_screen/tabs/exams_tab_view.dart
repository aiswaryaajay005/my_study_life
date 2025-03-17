import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';

class ExamsTabView extends StatefulWidget {
  const ExamsTabView({super.key});

  @override
  State<ExamsTabView> createState() => _ExamsTabViewState();
}

class _ExamsTabViewState extends State<ExamsTabView> {
  int selectedSubject = 0;
  int selectedType = 0;
  int selectedMode = 0;
  bool isOn = false;
  List typeName = ["Exam", "Quiz", "Test"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubjects(),
            _buildResitSection(),
            _buildTypeSection(context),
            _buildModeSection(),
            SizedBox(height: 5),
            _buildDateTimeDurationSection(),
            SizedBox(height: 10),
            _buildCancelOkButton(context),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Column _buildDateTimeDurationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Due Date*", style: TextStyle(fontWeight: FontWeight.bold)),
        ReusableFormField(hintText: "Fri, 4 Mar 2025", rad: 10),
        SizedBox(height: 10),
        Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
        ReusableFormField(hintText: "10:30 AM", rad: 10),
        SizedBox(height: 10),
        Text(
          "Duration (in Minutes)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ReusableFormField(hintText: "Duration(in Minutes)", rad: 10),
        SizedBox(height: 10),
      ],
    );
  }

  Column _buildModeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mode *", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          children: [
            _buildSelectableContainer(
              text: "In Person",
              isSelected: selectedMode == 0,
              onTap:
                  () => setState(() {
                    selectedMode = 0;
                  }),
            ),
            _buildSelectableContainer(
              text: " Online",
              isSelected: selectedMode == 1,
              onTap:
                  () => setState(() {
                    selectedMode = 1;
                  }),
            ),
          ],
        ),
        if (selectedMode == 0) ...[
          Text("Module*", style: TextStyle(fontWeight: FontWeight.bold)),
          ReusableFormField(hintText: "Module Name", rad: 10),
          SizedBox(height: 10),
          Text("Seat", style: TextStyle(fontWeight: FontWeight.bold)),
          ReusableFormField(hintText: "Seat", rad: 10),
          SizedBox(height: 10),
          Text("Room", style: TextStyle(fontWeight: FontWeight.bold)),
          ReusableFormField(hintText: "Room", rad: 10),
          SizedBox(height: 10),
        ] else if (selectedMode == 1) ...[
          Text("Module*", style: TextStyle(fontWeight: FontWeight.bold)),
          ReusableFormField(hintText: "Module Name", rad: 10),
          SizedBox(height: 10),
          Text("Online URL", style: TextStyle(fontWeight: FontWeight.bold)),
          ReusableFormField(hintText: "Paste URL Here"),
          SizedBox(height: 10),
        ],
      ],
    );
  }

  Column _buildTypeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),

        Row(
          children: [
            _buildSelectableContainer(
              text: "Exam",
              isSelected: selectedType == 0,
              onTap:
                  () => setState(() {
                    selectedType = 0;
                  }),
            ),
            _buildSelectableContainer(
              text: "Quiz",
              icons: Symbols.crown,
              isSelected: selectedType == 1,
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
              text: "Test",
              icons: Symbols.crown,
              isSelected: selectedType == 2,
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
      ],
    );
  }

  Row _buildResitSection() {
    return Row(
      children: [
        Text("Resit", style: TextStyle(fontWeight: FontWeight.bold)),
        Spacer(),
        Switch(
          activeColor: ColorConstants.buttonBlue,
          inactiveTrackColor: Colors.grey,
          value: isOn,
          onChanged: (value) {
            setState(() {
              isOn = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSubjects() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Subject *",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
      ),
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
      height: 50,
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
          if (icons != null) ...[
            SizedBox(width: 5),
            Icon(icons, color: Colors.blue, size: 20),
          ],
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
