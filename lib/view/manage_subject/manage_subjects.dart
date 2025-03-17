import 'package:flutter/material.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';
import 'package:my_study_life/view/new_subjects/new_subjects.dart';

class ManageSubjects extends StatefulWidget {
  const ManageSubjects({super.key});

  @override
  State<ManageSubjects> createState() => _ManageSubjectsState();
}

class _ManageSubjectsState extends State<ManageSubjects> {
  List<Map<String, dynamic>> subjects = [
    {
      "name": "ENGLISH",
      "image": ImageConstants.literature,
      "color": Colors.blue.shade500,
    },
    {
      "name": "MATHEMATICS",
      "image": ImageConstants.maths,
      "color": Colors.blue.shade900,
    },
    {"name": "SCIENCE", "image": ImageConstants.science, "color": Colors.green},
    {
      "name": "BIOLOGY",
      "image": ImageConstants.biology,
      "color": Colors.green.shade700,
    },
    {
      "name": "CHEMISTRY",
      "image": ImageConstants.chemistry,
      "color": Colors.red.shade900,
    },
    {
      "name": "PHYSICS",
      "image": ImageConstants.physics,
      "color": Colors.purple.shade800,
    },
    {
      "name": "MUSIC",
      "image": ImageConstants.music,
      "color": Colors.red.shade800,
    },
    {
      "name": "GEOGRAPHY",
      "image": ImageConstants.geography,
      "color": Colors.green.shade800,
    },
    {
      "name": "HISTORY",
      "image": ImageConstants.history,
      "color": Colors.yellow.shade800,
    },
    {
      "name": "COMPUTER SCIENCE",
      "image": ImageConstants.computer,
      "color": Colors.blue.shade800,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ReusablebackButton(),
            SizedBox(width: 70),
            Text("Manage Subjects", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: subjects.length,
          itemBuilder:
              (context, index) => Column(
                children: [
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 130,
                              width: 170,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      subjects[index]['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                        color: subjects[index]['color'],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Image.asset(
                                    subjects[index]['image'],
                                    height: 130,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    height: 130,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.white.withOpacity(0.9),
                                          Colors.white.withOpacity(0.2),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewSubjects()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
