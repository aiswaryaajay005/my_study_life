import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';
import 'package:my_study_life/view/bottom_navbar_screen/bottom_navbar_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Map<String, dynamic>> itemList = [
    {"title": "👀Pending Tasks", "count": "0", "subtitle": "Next 7 days"},
    {"title": "⚠Overdue Tasks", "count": "0", "subtitle": "Total"},
    {"title": "👍Tasks Completed", "count": "0", "subtitle": "Last 7 days"},
    {"title": "🔥Your Streak", "count": "0", "subtitle": "Total streak"},
  ];
  List<Color> colorGrad = [
    ColorConstants.lightYellow,
    ColorConstants.lightPink,
    ColorConstants.lightgreen,
    ColorConstants.lightPurple,
  ];
  List<Color> colorList = [
    ColorConstants.darkYellow,
    ColorConstants.darkPink,
    ColorConstants.darkGreen,
    ColorConstants.darkPurple,
  ];
  List<Map<String, dynamic>> tileItem = [
    {"icon": Icons.storage_rounded, "title": "Import CSV Data"},
    {"icon": Icons.military_tech, "title": "Premium Subscription"},
    {"icon": Icons.logout_outlined, "title": "Log out"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorConstants.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: Text("Profile")),
                SizedBox(width: 140),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit_sharp, color: Colors.black),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 30),
            _buildProfilePicture(),
            SizedBox(height: 10),
            Text(
              "Aiswarya Ajayakumar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              "aiswaryaajayakumar176@gmail.com",
              style: TextStyle(fontSize: 10),
            ),
            _buildGridViewBuilderMethod(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        tileItem[index]['icon'],
                        color: ColorConstants.selectBlue,
                      ),
                      title: Text(tileItem[index]['title']),
                      trailing: Icon(Icons.arrow_forward_ios_sharp),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Delete Account",
              style: TextStyle(color: ColorConstants.darkPink),
            ),
            SizedBox(height: 20),
            Text("v7.3.5 (257)", style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  DottedBorder _buildProfilePicture() {
    return DottedBorder(
      dashPattern: [3, 1],
      borderType: BorderType.Circle,
      color: ColorConstants.selectBlue,
      strokeWidth: 1,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text("Profile Picture", style: TextStyle(fontSize: 12)),
        ),
      ),
    );
  }

  Padding _buildGridViewBuilderMethod() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.3,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.white, colorGrad[index]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.7, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    itemList[index]['title'],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),

                  Text(
                    itemList[index]['count'],
                    style: TextStyle(fontSize: 24, color: colorList[index]),
                  ),
                  Text(
                    itemList[index]['subtitle'],
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
