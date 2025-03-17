import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';

class SupportedSchedules extends StatelessWidget {
  const SupportedSchedules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkestBlue6,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorConstants.darkestBlue5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          ImageConstants.timetable,

                          fit: BoxFit.contain,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Icon(Icons.info_outlined, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            "Supported Schedules",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "This feature is designed for particular \nschedule types.please review the supported \nformat before continuing",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "Currently our calender import feature only \nsupports non-rotational schedules.This \nmeans we can support schedules with \nvarying class times within a single week, \nbut cannot handle rotational class \npatterns (for example,schedules that \nrotate between Week A and Week B).",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "We're actively working to support \nadditional schedule types. Stay tubed for \n updates",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        buttonText: "Continue",
                        onButtonPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PremiumSubscription(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          textAlign: TextAlign.justify,
                          "Importing schedules via camera is a premium feature. By proceeding, \nyou confirm that your calender is compatible with this feature and accept any risks associated with potential compatibility issues.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                          ),
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
