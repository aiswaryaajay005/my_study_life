import 'package:flutter/material.dart';

class ReusableSubjectField extends StatefulWidget {
  const ReusableSubjectField({super.key});

  @override
  State<ReusableSubjectField> createState() => _ReusableSubjectFieldState();
}

class _ReusableSubjectFieldState extends State<ReusableSubjectField> {
  List<String> subjects = [
    "All subjects",
    "English",
    "Mathematics",
    "Science",
    "Biology",
    "Chemistry",
    "Physics",
    "Music",

    "History",
    "Geography",
    "Computer Science",
  ];

  String? dropValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "All Subjects",
        ),
        items: List.generate(
          subjects.length,
          (index) => DropdownMenuItem(
            child: Text(subjects[index]),
            value: subjects[index],
          ),
        ),
        onChanged: (value) {
          dropValue = value;
          setState(() {});
        },
      ),
    );
  }
}
