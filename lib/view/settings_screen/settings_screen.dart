import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/csv_screen/csv_screen.dart';
import 'package:my_study_life/view/manage_subject/manage_subjects.dart';
import 'package:my_study_life/view/personalized_settings/personalised_settings.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';
import 'package:my_study_life/view/reminder_screen/reminder_screen.dart';
import 'package:my_study_life/view/schedule_setup/schedule_setup.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Map<String, dynamic>> tileItem = [
    {"icon": Symbols.description, "title": "Schedule Set Up"},
    {"icon": Symbols.user_attributes, "title": "Personalize"},
    {"icon": Symbols.notifications, "title": "Reminders"},
    {"icon": Symbols.note, "title": "Manage Subjects"},
  ];
  List<Map<String, dynamic>> secondTileItem = [
    {"icon": Symbols.support, "title": "Support"},
    {"icon": Icons.info_outline, "title": "About"},
  ];
  List btmScreens = [
    ScheduleSetup(),
    PersonalisedSettings(),
    ReminderScreen(),
    ManageSubjects(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ReusablebackButton(),
            SizedBox(width: 70),
            Text("Settings", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildListLinks(count: 4),
            SizedBox(height: 30),
            _buildSecondListLinks(count: 2),
          ],
        ),
      ),
    );
  }

  Container _buildListLinks({required int count}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => btmScreens[index]),
              );
            },
            child: ListTile(
              leading: Icon(
                tileItem[index]['icon'],
                color: ColorConstants.selectBlue,
              ),
              title: Text(tileItem[index]['title']),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          );
        },
      ),
    );
  }

  Container _buildSecondListLinks({required int count}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                secondTileItem[index]['icon'],
                color: ColorConstants.selectBlue,
              ),
              title: Text(secondTileItem[index]['title']),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          );
        },
      ),
    );
  }
}
