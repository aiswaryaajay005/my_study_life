import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class ClassesTabView extends StatefulWidget {
  const ClassesTabView({super.key});

  @override
  State<ClassesTabView> createState() => _ClassesTabViewState();
}

class _ClassesTabViewState extends State<ClassesTabView> {
  int? selectedSubject = 0;
  int? selectedDate = 0;
  int? selectedMode = 0;
  int? selectedOccurs = 0;
  int? selectedDay = 0;
  List days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //subjects
            _buildSubjects(),
            SizedBox(height: 5),
            //dates
            _buildDates(), SizedBox(height: 5),
            _buildOccursSection(), SizedBox(height: 5),
            if (selectedOccurs == 0) ...[
              Text("Date*"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Fri,4 Mar 2022"),
                ),
              ),
              SizedBox(height: 5),
            ] else if (selectedOccurs == 1) ...[
              Text("Days"),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: days.length,
                shrinkWrap: true,
                itemBuilder:
                    (context, index) => Row(
                      children: [
                        _buildSelectableContainer(
                          text: days[index],
                          isSelected: selectedDay == index,
                          onTap:
                              () => setState(() {
                                selectedDay = index;
                              }),
                        ),
                      ],
                    ),
              ),
              SizedBox(height: 5),
            ],
            _buildStartEndTimeSection(),
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
              SizedBox(height: 5),
              Text("Room", style: TextStyle(fontWeight: FontWeight.bold)),
              ReusableFormField(hintText: "Room"),
              SizedBox(height: 5),
              Text("Building", style: TextStyle(fontWeight: FontWeight.bold)),
              ReusableFormField(hintText: "Building"),
              SizedBox(height: 5),
              Text("Teacher", style: TextStyle(fontWeight: FontWeight.bold)),
              ReusableFormField(hintText: "Teacher Name"),
              SizedBox(height: 5),
            ] else if (selectedMode == 1) ...[
              Text("Module*", style: TextStyle(fontWeight: FontWeight.bold)),
              ReusableFormField(hintText: "Module Name", rad: 10),
              SizedBox(height: 5),
              Text("Online URL", style: TextStyle(fontWeight: FontWeight.bold)),
              ReusableFormField(hintText: "Paste URL Here"),
              SizedBox(height: 5),
              Text("Teacher", style: TextStyle(fontWeight: FontWeight.bold)),
              ReusableFormField(hintText: "Teacher Name"),
              SizedBox(height: 5),
              Text(
                "Teacher's Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ReusableFormField(hintText: "Email"),
              SizedBox(height: 15),
            ],
            _buildCancelOkButton(context), SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Column _buildStartEndTimeSection() {
    return Column(
      children: [
        Row(
          children: [
            Text("Start Time*", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 40),
            Text("End Time*", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              width: 60,
              child: Center(child: Text("08.00")),
            ),
            SizedBox(width: 60),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 50,
              width: 60,
              child: Center(child: Text("09.00")),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildOccursSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                setState(() {
                  selectedOccurs = 1;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Column _buildDates() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Start/end dates *",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(Symbols.help),
          ],
        ),
        Row(
          children: [
            _buildSelectableContainer(
              text: "None",
              isSelected: selectedDate == 0,
              onTap:
                  () => setState(() {
                    selectedDate = 0;
                  }),
            ),
            _buildSelectableContainer(
              text: "Academic year/term",
              isSelected: selectedDate == 1,
              onTap:
                  () => setState(() {
                    selectedDate = 1;
                  }),
            ),
            _buildSelectableContainer(
              text: "Manual",
              isSelected: selectedDate == 2,
              onTap:
                  () => setState(() {
                    selectedDate = 2;
                  }),
            ),
          ],
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
        buttonText: "Save Class",
        onButtonPressed: () {},
      ),
    ],
  );
}
