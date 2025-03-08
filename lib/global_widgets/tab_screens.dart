import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/personalized_settings/personalised_settings.dart';

class TabScreens extends StatelessWidget {
  const TabScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.lightGrey,
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset(ImageConstants.pnglogo, height: 100, width: 100),
          Text(
            "No classes,tasks or exams for the next 5 days",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            "You can adjust what is displayed on your ",
            style: TextStyle(fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("homepage in", style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalisedSettings(),
                    ),
                  );
                },
                child: Text(
                  "personalised settings",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
