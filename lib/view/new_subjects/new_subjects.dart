import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:my_study_life/global_widgets/custom_button.dart';
import 'package:my_study_life/global_widgets/reusable_back_button.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/utils/constants/image_constants.dart';

class NewSubjects extends StatefulWidget {
  const NewSubjects({super.key});

  @override
  State<NewSubjects> createState() => _NewSubjectsState();
}

class _NewSubjectsState extends State<NewSubjects> {
  List<Color> color = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green.shade800,
    Colors.green,
    Colors.lightGreen,
    Colors.blue,
    Colors.lightBlue,
    Colors.purple,
    Colors.deepPurple,
    Colors.pink,
    Colors.pinkAccent,
  ];
  final List images = [
    ImageConstants.literature,
    ImageConstants.physics,
    ImageConstants.chemistry,
    ImageConstants.biology,
    ImageConstants.science,
    ImageConstants.music,
    ImageConstants.geography,
    ImageConstants.history,
    ImageConstants.computer,
    ImageConstants.maths,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            ReusablebackButton(),
            SizedBox(width: 50),
            Text(
              "New Subject",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subject Name*",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text("Color", style: TextStyle(fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                spacing: 10,
                children: List.generate(
                  color.length,
                  (index) => Row(
                    children: [CircleAvatar(backgroundColor: color[index])],
                  ),
                ),
              ),
            ),
            Text("Photo", style: TextStyle(fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                spacing: 15,
                children: List.generate(
                  images.length,
                  (index) => Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 150,
              decoration: BoxDecoration(
                color: ColorConstants.lightblue3,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text("Upload Photo"),
                  Icon(Symbols.crown, color: ColorConstants.buttonBlue),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: CustomButton(
                buttonText: "Save Subject",
                onButtonPressed: () {},
                cWidth: 200,
              ),
            ),
            Center(
              child: CustomButton(
                buttonText: "Cancel",
                onButtonPressed: () {
                  Navigator.pop(context);
                },
                cWidth: 200,
                bgColor: ColorConstants.lightGrey,
                textColor: ColorConstants.buttonBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
