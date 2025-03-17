import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/ai_schedule_screen/supported_schedules.dart';

class AiScheduleScreen extends StatefulWidget {
  const AiScheduleScreen({super.key});

  @override
  State<AiScheduleScreen> createState() => _AiScheduleScreenState();
}

class _AiScheduleScreenState extends State<AiScheduleScreen> {
  List offerings = [
    "Xtra- comprehensive life tracker",
    "Grade Tracking",
    "dark Mode",
    "Personalization and statistics",
    "Widgets",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkestBlue6,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstants.darkestBlue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Image.asset(
                          ImageConstants.scan,
                          height: 250,
                          width: 200,
                        ),
                      ),
                      Text(
                        "Schedule import",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Effortlessly set up your schedule in seconds using your phone camera. Join MSL+ nowto get started and unlock exclusive benefits:",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 20),
                                  Text(
                                    offerings[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        buttonText: "Continue",
                        onButtonPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupportedSchedules(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
