import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/login_screen/login_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Enter your registered email and we'll send you a \npassword reset link.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 40),
                      ReusableFormField(hintText: "Your Email"),
                      SizedBox(height: 10),

                      CustomButton(
                        buttonText: "Send password reset link",
                        onButtonPressed: () {},
                      ),
                      SizedBox(height: 36),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back to login",
                          style: TextStyle(color: ColorConstants.darkblue),
                        ),
                      ),
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
