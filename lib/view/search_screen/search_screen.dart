import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/calender_drawer_items.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Added padding for spacing
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close_rounded),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstants.lightGrey1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstants.lightGrey1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 55,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorConstants.buttonBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: _buildPopUpMenu(),
                ),
              ],
            ),
            SizedBox(height: 300),
            Column(
              children: [
                Icon(Icons.info, color: Colors.grey),
                Text("No Results Found"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildPopUpMenu() {
    return Column(
      children: [
        PopupMenuButton<String>(
          icon: Icon(Symbols.tune, color: Colors.white),
          color: Colors.white,
          padding: EdgeInsets.all(10),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: CalendarDrawerItem(
                  borderClr: ColorConstants.darkclass,
                  boxColor: Colors.green.shade50,
                  title: "Classes",
                ),
              ),

              PopupMenuItem(
                child: CalendarDrawerItem(
                  borderClr: ColorConstants.darkExam,
                  boxColor: ColorConstants.lightExam,

                  title: "Exams",
                ),
              ),
              PopupMenuItem(
                child: CalendarDrawerItem(
                  borderClr: ColorConstants.darkTasks,
                  boxColor: ColorConstants.lightTasks,
                  title: "Tasks",
                ),
              ),
              PopupMenuItem(
                child: CalendarDrawerItem(
                  borderClr: ColorConstants.darkHolidays,
                  boxColor: ColorConstants.lightHolidays,
                  title: "Holidays",
                ),
              ),
              PopupMenuItem(
                child: CalendarDrawerItem(
                  borderClr: ColorConstants.darkXtra,
                  boxColor: ColorConstants.lightXtra,

                  title: "Xtra",
                ),
              ),
              PopupMenuItem(
                child: CalendarDrawerItem(
                  borderClr: ColorConstants.darkIcals,
                  boxColor: ColorConstants.lightIcals,
                  title: "ICal",
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
