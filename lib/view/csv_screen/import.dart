import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class Import extends StatelessWidget {
  const Import({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                ReusablebackButton(),
                SizedBox(width: 70),
                Text("Import CSV Data"),
              ],
            ),
            Text(
              "Import data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Let's transfer your data over to our new version!",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            DottedBorder(
              dashPattern: [6],
              color: ColorConstants.buttonBlue,
              child: SizedBox(
                height: 100,
                width: 500,
                child: Container(
                  height: 30,
                  width: 50,

                  child: Center(child: Text("Browse Files")),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: CustomButton(buttonText: "Upload", onButtonPressed: () {}),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
