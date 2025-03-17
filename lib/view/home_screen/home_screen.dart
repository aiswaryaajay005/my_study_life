import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:my_study_life/view/home_screen/tabs/class_tab.dart';
import 'package:my_study_life/view/home_screen/tabs/exam_tab.dart';
import 'package:my_study_life/view/home_screen/tabs/icals_tab.dart';
import 'package:my_study_life/view/home_screen/tabs/task_tab.dart';
import 'package:my_study_life/view/search_screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorConstants.lightGrey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Column(
              children: [
                Text("Sunday"),
                Text("March 02,2025", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.search),
              ),
            ),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicator: BoxDecoration(
              color: Colors.blue,

              borderRadius: BorderRadius.circular(5),
            ),
            unselectedLabelColor: Colors.blue,
            labelColor: Colors.white,
            tabs: [
              Tab(text: "    0 Classes    "),
              Tab(text: "    0 Exams      "),
              Tab(text: "    0 Tasks Due    "),
              Tab(text: "    0 iCal    "),
            ],
          ),
        ),
        body: TabBarView(
          children: [ClassTab(), ExamTab(), TaskTab(), IcalsTab()],
        ),
      ),
    );
  }
}
