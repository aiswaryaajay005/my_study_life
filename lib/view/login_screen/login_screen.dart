import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:my_study_life/view/forgot_password/forgot_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Log in with email",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.black,
                      ),
                    ),
                    SizedBox(height: 40),
                    ReusableFormField(hintText: "Your Email"),
                    ReusableFormField(
                      hintText: "Password",
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    CustomButton(
                      buttonText: "Sign In",
                      onButtonPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavbarScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    SizedBox(height: 36),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: ColorConstants.darkblue),
                      ),
                    ),
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
