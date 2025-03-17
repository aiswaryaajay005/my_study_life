import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class IcalConnectScreen extends StatelessWidget {
  const IcalConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          children: [
            ReusablebackButton(),
            SizedBox(width: 70),
            Text("iCalenders", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(ImageConstants.pnglogo, height: 100, width: 100),
              Text(
                "Sync your MyStudyLife schedule with iCal to keep all your tasks, alsses, exams and events in one place",
              ),
              SizedBox(height: 200),
              InkWell(
                onTap:
                    () => showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) => _buildBottomSheet(context),
                    ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ColorConstants.selectBlue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add iCal", style: TextStyle(color: Colors.grey)),
                        Icon(Icons.add, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildBottomSheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Add ical",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: Text("Title")),
          ReusableFormField(hintText: "Enter iCal title"),
          Padding(padding: const EdgeInsets.all(8.0), child: Text("iCal URL")),
          ReusableFormField(hintText: "Enter iCal url", maxLines: 3),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildCancelOkButton(context),
          ),
        ],
      ),
    );
  }

  Row _buildCancelOkButton(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          buttonText: "Cancel",
          bgColor: ColorConstants.lightGrey,
          textColor: ColorConstants.buttonBlue,
          cWidth: 150,
          onButtonPressed: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    alignment: Alignment.bottomCenter,
                    title: Text("Are you sure"),

                    actions: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              buttonText: "No",
                              onButtonPressed: () {
                                Navigator.pop(context);
                              },
                              bgColor: ColorConstants.lightblue,
                              textColor: ColorConstants.buttonBlue,
                              cWidth: 150,
                            ),
                            SizedBox(height: 10),
                            CustomButton(
                              buttonText: "Yes",
                              onButtonPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },

                              cWidth: 150,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            );
          },
        ),
        Spacer(),
        CustomButton(
          cWidth: 150,
          buttonText: "Add Save",
          onButtonPressed: () {},
        ),
      ],
    );
  }
}
