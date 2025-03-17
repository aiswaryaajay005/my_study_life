import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';

class PomodoroSettings extends StatefulWidget {
  const PomodoroSettings({super.key});

  @override
  State<PomodoroSettings> createState() => _PomodoroSettingsState();
}

class _PomodoroSettingsState extends State<PomodoroSettings> {
  String? dropValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ReusablebackButton(),
            Text(
              "Pomodoro Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text("Timer"),
          _buildTimeSelection(hint: "Focus Time", preText: "Focus Time"),
          _buildTimeSelection(preText: "Short Break", hint: "Short Break"),
        ],
      ),
    );
  }

  DropdownButtonFormField<String> _buildTimeSelection({
    required String preText,
    required String hint,
  }) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white,

        hintText: hint,
        prefixText: preText,
      ),

      value: dropValue,
      items: List.generate(
        60,
        (index) => DropdownMenuItem(
          value: "${index + 1} min",
          child: Text("${index + 1} min"),
        ),
      ),
      onChanged: (value) {
        setState(() {
          dropValue = value;
        });
      },
    );
  }
}
