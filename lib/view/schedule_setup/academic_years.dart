import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/schedule_setup/new_year.dart';

class AcademicYears extends StatelessWidget {
  const AcademicYears({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            ReusablebackButton(),
            SizedBox(width: 50),
            Text(
              "Academic Years",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: ColorConstants.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewYear()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(5),
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConstants.buttonBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      " Add New Academic Year",
                      style: TextStyle(color: ColorConstants.lightGrey1),
                    ),
                    Spacer(),
                    Icon(Icons.add),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
