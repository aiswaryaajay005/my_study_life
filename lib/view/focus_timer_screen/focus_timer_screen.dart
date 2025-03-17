import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

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
  const PomodoroTimer({super.key});

  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  static const int workDuration = 25 * 60;
  static const int breakDuration = 5 * 60;
  int remainingTime = workDuration;
  bool isRunning = false;
  bool isWorkSession = true;
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
      appBar: AppBar(backgroundColor: Colors.transparent),
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
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    value:
                        remainingTime /
                        (isWorkSession ? workDuration : breakDuration),
                    strokeWidth: 15,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isWorkSession ? Colors.lightBlue : Colors.blue,
                    ),
                    backgroundColor: Colors.white24,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      formatTime(remainingTime),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[300],
                      ),
                    ),
                    Text(
                      "Focus",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(width: 80),

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
    );
  }
}
