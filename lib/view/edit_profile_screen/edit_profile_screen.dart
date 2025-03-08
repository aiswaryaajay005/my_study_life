import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorConstants.lightGrey);
  }
}
