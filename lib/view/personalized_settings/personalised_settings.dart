import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class PersonalisedSettings extends StatelessWidget {
  const PersonalisedSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        leading: Row(
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ],
        ),
        title: Center(
          child: Text("Personalize", style: TextStyle(fontSize: 24)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Which country are you from?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "If you want to, let us know where you are from so that \nwe can suggest you the most relevnt personalization",
            ),
          ],
        ),
      ),
    );
  }
}
