import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
            image: AssetImage(ImageConstants.background),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 20,
              child: FloatingActionButton(
                backgroundColor: ColorConstants.floatColor,
                shape: CircleBorder(),

                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 750,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Sign up with email",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.black,
                        ),
                      ),
                      SizedBox(height: 40),
                      ReusableFormField(hintText: "Your Name"),
                      SizedBox(height: 10),
                      ReusableFormField(hintText: "Your Email"),
                      SizedBox(height: 10),
                      ReusableFormField(
                        hintText: "New Password",
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      SizedBox(height: 10),
                      ReusableFormField(
                        hintText: "Confirm Password",
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        buttonText: "Sign Up",
                        onButtonPressed: () {},
                      ),
                      SizedBox(height: 36),
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
