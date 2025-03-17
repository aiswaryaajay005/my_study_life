import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  // List of reminder names
  final List<String> reminders = [
    "Reminders",
    "Sound",
    "Vibrate",
    "Class Reminders",
    "Exam Reminders",
    "Xtra Reminders",
    "Task Reminders",
  ];

  List<bool> switchStates = [];

  @override
  void initState() {
    super.initState();

    switchStates = List.generate(reminders.length, (index) => false);
  }

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
              "Reminders",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: reminders.length,
          itemBuilder: (context, index) {
            return _buildSwitchTile(reminders[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(" $title", style: TextStyle(color: ColorConstants.black)),
          Spacer(),
          Switch(
            activeColor: ColorConstants.buttonBlue,
            inactiveTrackColor: Colors.grey,
            value: switchStates[index],
            onChanged: (value) {
              setState(() {
                switchStates[index] = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
