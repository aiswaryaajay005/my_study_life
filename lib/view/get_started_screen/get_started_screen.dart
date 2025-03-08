import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/login_screen/login_screen.dart';
import 'package:my_study_life/view/signup_screen/signup_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Column(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.book),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.white.withOpacity(0.8), // White at the bottom
                        Colors.white.withOpacity(0.5), // Mid transition
                        Colors.white.withOpacity(0.0), // Transparent at the top
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Positioned(
                  top: 30,

                  child: Container(
                    height: 80,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "EXISTING USERS: Please login and use the 'import CSV Data' \noption at the bottom of the profile page ",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "More info here",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 120,
                  right: 120,
                  child: Container(
                    height: 150,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageConstants.logo),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Get Started",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Continue with...",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 15),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(ImageConstants.googlelogo),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Expanded(
                        child: Divider(
                          color: ColorConstants.darkgrey,
                          thickness: 1.5,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text("Or", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 15),
                      Expanded(
                        child: Divider(
                          color: ColorConstants.darkgrey,
                          thickness: 1.5,
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomButton(
                    buttonText: "Log in with email",
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    buttonText: "Sign up with email",
                    bgColor: ColorConstants.lightGrey,
                    textColor: ColorConstants.buttonBlue,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "By continuing, you agree to our privacy policy & terms of \nuse",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "v7..3.5 (257)",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
