import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  ),
                ),
                SizedBox(width: 80),
                Center(
                  child: Text("Edit Profile", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            SizedBox(height: 30),
            _buildProfilePicture(),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "First Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),
                ReusableFormField(
                  hintText: "Aiswarya",
                  bgColor: Colors.white,
                  textColor: Colors.black,
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Last Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5),
                ReusableFormField(
                  hintText: "Ajayakumar",
                  bgColor: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              buttonText: "Save",
              onButtonPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 30),
            CustomButton(
              buttonText: "Cancel",
              onButtonPressed: () {
                Navigator.pop(context);
              },
              bgColor: Colors.transparent,
              textColor: ColorConstants.buttonBlue,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

Widget _buildProfilePicture() {
  return Stack(
    children: [
      DottedBorder(
        dashPattern: [3, 1],
        borderType: BorderType.Circle,
        color: ColorConstants.selectBlue,
        strokeWidth: 1,
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text("Profile Picture", style: TextStyle(fontSize: 12)),
          ),
        ),
      ),
      Positioned(
        bottom: 2,
        right: 10,
        child: CircleAvatar(
          radius: 13,
          backgroundColor: ColorConstants.selectBlue,
          child: Icon(Icons.edit, color: Colors.white),
        ),
      ),
    ],
  );
}
