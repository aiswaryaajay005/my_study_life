import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class ReusableFormField extends StatelessWidget {
  final String hintText;
  final Icon? suffixIcon;
  final double bottomPadding;
  final TextEditingController? controller;

  const ReusableFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.bottomPadding = 20,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: bottomPadding),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: ColorConstants.lightGrey1,
          hintText: hintText,
          hintStyle: TextStyle(color: ColorConstants.lightGrey2),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.lightGrey3),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.lightGrey3),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.lightGrey3),
          ),
        ),

        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
