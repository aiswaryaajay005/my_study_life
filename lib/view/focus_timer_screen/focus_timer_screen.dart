import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:my_study_life/view/calender_screen/calender_screen.dart';
import 'package:my_study_life/view/home_screen/home_screen.dart';
import 'package:my_study_life/view/menu_screen/menu_screen.dart';
import 'package:my_study_life/view/profile_screen/profile_screen.dart';

void main() {
  runApp(FocusTimerScreen());
}

class FocusTimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroTimer(),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  static const int workDuration = 25 * 60; // 25 minutes
  static const int breakDuration = 5 * 60; // 5 minutes
  int remainingTime = workDuration;
  bool isRunning = false;
  bool isWorkSession = true; // Track if it's work or break time
  Timer? timer;

  void startPauseTimer() {
    if (isRunning) {
      timer?.cancel();
    } else {
      timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        if (remainingTime > 0) {
          setState(() {
            remainingTime--;
          });
        } else {
          switchSession();
        }
      });
    }
    setState(() {
      isRunning = !isRunning;
    });
  }

  void switchSession() {
    timer?.cancel();
    setState(() {
      isWorkSession = !isWorkSession;
      remainingTime = isWorkSession ? workDuration : breakDuration;
      isRunning = false;
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      remainingTime = workDuration;
      isWorkSession = true;
      isRunning = false;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        title: Text("Pomodoro Timer"),
        backgroundColor: ColorConstants.lightGrey,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isWorkSession ? "Work Time" : "Break Time",
              style: TextStyle(fontSize: 24, color: ColorConstants.selectBlue),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    value:
                        remainingTime /
                        (isWorkSession ? workDuration : breakDuration),
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isWorkSession ? Colors.lightBlue : Colors.blue,
                    ),
                    backgroundColor: Colors.white24,
                  ),
                ),
                Text(
                  formatTime(remainingTime),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   onPressed: startPauseTimer,
                //   child: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.green,
                //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                //   ),
                // ),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Icon(Icons.refresh_outlined),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.grey.shade400,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                InkWell(
                  onTap: startPauseTimer,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.lightBlue.shade200],
                      ),
                    ),
                    child: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                  ),
                ),

                SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}

Widget bottomNavBar() {
  return Scaffold(
    backgroundColor: ColorConstants.lightGrey,
    body: PomodoroTimer(),
    floatingActionButton: FloatingActionButton(
      shape: CircleBorder(),
      backgroundColor: Colors.blue,
      onPressed: () {},
      child: Icon(Icons.add, color: Colors.white),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: Container(
      height: 100,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (value) {},

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ColorConstants.unSelectGrey),
            activeIcon: Icon(Icons.home, color: ColorConstants.selectBlue),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_rounded,
              color: ColorConstants.unSelectGrey,
            ),
            activeIcon: Icon(
              Icons.calendar_month_rounded,
              color: ColorConstants.selectBlue,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_rounded,
              color: ColorConstants.unSelectGrey,
            ),
            activeIcon: Icon(
              Icons.grid_view_rounded,
              color: ColorConstants.selectBlue,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_4_outlined,
              color: ColorConstants.unSelectGrey,
            ),
            activeIcon: Icon(
              Icons.person_4_outlined,
              color: ColorConstants.selectBlue,
            ),
            label: "",
          ),
        ],
      ),
    ),
  );
}
