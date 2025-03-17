import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class PremiumSubscription extends StatefulWidget {
  const PremiumSubscription({super.key});

  @override
  State<PremiumSubscription> createState() => _PremiumSubscriptionState();
}

class _PremiumSubscriptionState extends State<PremiumSubscription> {
  bool isSelected = false;
  int? selectedIndex;
  bool? checkValue = false;
  bool? checkValue1 = false;
  List tileData = [
    "Xtra - a comprehensive life planner",
    "Grade Tracking",
    "AI Timetable Wizard Calender Import",
    "Personalization",
    "Widgets",
    "Dark Mode",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey4,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageConstants.premium),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "MyStudyLife +",
                      style: TextStyle(
                        color: ColorConstants.darkestBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(6, (index) {
                      return ListTile(
                        leading: IconTheme(
                          data: IconThemeData(size: 20),
                          child: Icon(
                            Icons.check_sharp,
                            color: ColorConstants.darkestBlue2,
                          ),
                        ),
                        title: Text(
                          tileData[index],
                          style: TextStyle(
                            color: ColorConstants.darkestBlue4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  ),
                  // SizedBox(
                  //   height: 400,
                  //   child: ListView.builder(
                  //     itemCount: 6,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         leading: IconTheme(
                  //           data: IconThemeData(size: 20),
                  //           child: Icon(
                  //             Icons.check_sharp,
                  //             color: ColorConstants.darkestBlue2,
                  //           ),
                  //         ),
                  //         title: Text(
                  //           tileData[index],
                  //           style: TextStyle(
                  //             color: ColorConstants.darkestBlue4,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color:
                              selectedIndex == 0
                                  ? ColorConstants.darkestBlue2
                                  : ColorConstants.lightGrey1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              selectedIndex == 0
                                  ? Icon(Icons.check_circle, color: Colors.blue)
                                  : Icon(
                                    Icons.circle_outlined,
                                    color: ColorConstants.lightblue3,
                                  ),
                              Text("MyStudyLife+"),
                              Spacer(),
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color:
                                      selectedIndex == 0
                                          ? ColorConstants.darkestBlue2
                                          : ColorConstants.lightGrey1,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: ColorConstants.lightGrey,
                                  ),
                                ),
                                child: Center(child: Text("67% off")),
                              ),
                            ],
                          ),
                          Text(
                            "First 1 week free, then ₹990.00/year (₹82.50/ \nmonth).You can cancel anytime during the trail to \navoid charges",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color:
                              selectedIndex == 1
                                  ? ColorConstants.darkestBlue2
                                  : ColorConstants.lightGrey1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              selectedIndex == 1
                                  ? Icon(Icons.check_circle, color: Colors.blue)
                                  : Icon(
                                    Icons.circle_outlined,
                                    color: ColorConstants.lightblue3,
                                  ),
                              Text("MyStudyLife+"),
                              Spacer(),
                            ],
                          ),
                          Text(
                            "First 1 week free, then ₹250.00/month.You can cancel anytime during the trial to \navoid charges",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevents unnecessary expansion
          children: [
            CustomButton(
              bgColor: ColorConstants.darkestBlue3,
              rad: 30,
              buttonText: "Start your 1-week free trial",
              onButtonPressed: () {},
            ),
            SizedBox(height: 10), // Add spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Restore"),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: ColorConstants.darkestBlue4,
                  radius: 2,
                ),
                SizedBox(width: 5),
                Text("Terms"),
                SizedBox(width: 5),
                CircleAvatar(
                  backgroundColor: ColorConstants.darkestBlue4,
                  radius: 2,
                ),
                SizedBox(width: 5),
                Text("Privacy Policy"),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
