import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reuseable_form_field.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';

class VacationTabView extends StatefulWidget {
  const VacationTabView({super.key});

  @override
  State<VacationTabView> createState() => _VacationTabViewState();
}

class _VacationTabViewState extends State<VacationTabView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Names", style: TextStyle(fontWeight: FontWeight.bold)),
            ReusableFormField(hintText: "Vacations Name"),
            SizedBox(height: 10),
            Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
            ReusableFormField(
              hintText: "Vacation Description",
              maxLines: 4,
              rad: 10,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Date*",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Fri, 4 Mar 2022")),
                    ),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "End  Date*",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("Fri, 4 Mar 2022")),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Photo", style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Symbols.crown, color: ColorConstants.buttonBlue, size: 20),
              ],
            ),
            Row(
              children: [
                DottedBorder(
                  strokeWidth: 2,
                  dashPattern: [3],
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Personalize with a photo of your \nchoice",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      buttonText: "+ Upload photo",
                      cWidth: 150,
                      onButtonPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PremiumSubscription(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildCancelOkButton(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
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
        buttonText: "Save Vacation",
        onButtonPressed: () {},
      ),
    ],
  );
}
