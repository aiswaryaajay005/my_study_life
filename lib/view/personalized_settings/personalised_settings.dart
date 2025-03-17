import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/premium_subscription/premium_subscription.dart';

class PersonalisedSettings extends StatefulWidget {
  const PersonalisedSettings({super.key});

  @override
  State<PersonalisedSettings> createState() => _PersonalisedSettingsState();
}

class _PersonalisedSettingsState extends State<PersonalisedSettings> {
  int? selectedDateFormat = 0;
  int? selectedTimeFormat = 0;
  int? selectedDaysDisplay = 0;
  int? selectedSessionName = 0;
  int? selectedDayOffName = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                const ReusablebackButton(),
                const SizedBox(width: 70),
                const Text("Personalize", style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Text(
                  "Which country are you from?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Symbols.crown, color: Colors.yellow, size: 20),
              ],
            ),
            Text(
              "If you want to, let us know where you are from so that we can suggest you the most relevant personalization",
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PremiumSubscription(),
                  ),
                );
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 15),
                    Text("Select your country"),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Date format you prefer",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildSelectableContainer(
                        text: "Jan 1, 2022",
                        isSelected: selectedDateFormat == 0,
                        onTap: () => setState(() => selectedDateFormat = 0),
                      ),

                      _buildSelectableContainer(
                        text: "1 Jan, 2022",
                        isSelected: selectedDateFormat == 1,
                        onTap: () => setState(() => selectedDateFormat = 1),
                      ),
                      _buildSelectableContainer(
                        text: "2022, Jan 1",
                        isSelected: selectedDateFormat == 2,
                        onTap: () => setState(() => selectedDateFormat = 2),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Text(
              "Time format you prefer",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  children: [
                    _buildSelectableContainer(
                      text: "12 hrs (Eg. 3pm)",
                      isSelected: selectedTimeFormat == 0,
                      onTap: () => setState(() => selectedTimeFormat = 0),
                    ),
                    _buildSelectableContainer(
                      text: "24 hrs (Eg. 15:00)",
                      isSelected: selectedTimeFormat == 1,
                      onTap: () => setState(() => selectedTimeFormat = 1),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),
            const Text(
              "Days to display on the dashboard",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => _buildSelectableContainer(
                        text: (index + 1).toString(),
                        isSelected: selectedDaysDisplay == index,
                        onTap:
                            () => setState(() => selectedDaysDisplay = index),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Text(
              "What do you call your taught sessions?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Text(
              "What do you call the times when you are being taught by a teacher/lecturer?",
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  children: [
                    _buildSelectableContainer(
                      text: "Lessons",
                      icons: Symbols.crown,
                      isSelected: selectedSessionName == 0,
                      onTap: () => setState(() => selectedSessionName = 0),
                    ),
                    _buildSelectableContainer(
                      text: "Classes",
                      icons: Symbols.crown,
                      isSelected: selectedSessionName == 1,
                      onTap: () => setState(() => selectedSessionName = 1),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),
            const Text(
              "What do you prefer calling your days off?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Text(
              "What do you call the periods of time when you do not attend school?",
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  children: [
                    _buildSelectableContainer(
                      text: "Holidays",
                      isSelected: selectedDayOffName == 0,
                      onTap: () => setState(() => selectedDayOffName = 0),
                      icons: Symbols.crown,
                    ),
                    _buildSelectableContainer(
                      text: "Vacation",
                      isSelected: selectedDayOffName == 1,
                      onTap: () => setState(() => selectedDayOffName = 1),
                      icons: Symbols.crown,
                    ),
                    _buildSelectableContainer(
                      text: "Days off",
                      isSelected: selectedDayOffName == 2,
                      onTap: () => setState(() => selectedDayOffName = 2),
                      icons: Symbols.crown,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    IconData? icons,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.lightBlue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? Colors.blue.shade400 : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.blue : ColorConstants.buttonBlue,
              ),
            ),
            SizedBox(width: 5),
            Icon(icons, color: Colors.blue, size: 20),
          ],
        ),
      ),
    );
  }
}
