import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/csv_screen/import.dart';

class CsvScreen extends StatelessWidget {
  const CsvScreen({super.key});

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
                Text('Import CSV Data'),
              ],
            ),
            Text(
              "Import Data",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Let's transfer your data over to our new version!",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            DottedBorder(
              radius: Radius.circular(15),
              color: ColorConstants.buttonBlue,
              dashPattern: [7],

              child: Container(
                margin: EdgeInsets.all(20),
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1.Please navigate to V1 of the MyStudyLife web app."),
                    SizedBox(height: 15),
                    Text(
                      "2.In the web app,find the profile button in the bottom left corner, click this and find the Export Data Option.",
                    ),
                    SizedBox(height: 15),
                    Text("3.Press Export Data."),
                    SizedBox(height: 15),
                    Image.asset(ImageConstants.csv),
                  ],
                ),
              ),
            ),
            SizedBox(height: 70),
            Center(
              child: CustomButton(
                buttonText: "Next",
                onButtonPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Import()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
