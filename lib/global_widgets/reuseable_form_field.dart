import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class ReusableFormField extends StatelessWidget {
  final String hintText;
  final Icon? suffixIcon;
  final double bottomPadding;
  final TextEditingController? controller;
  final Color? bgColor;
  final Color? textColor;
  final int? maxLines;
  final double? rad;
  const ReusableFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.bottomPadding = 20,
    this.controller,
    this.bgColor,
    this.textColor,
    this.maxLines,
    this.rad,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor ?? Colors.white,
        suffixIcon: suffixIcon,
        suffixIconColor: ColorConstants.lightGrey1,
        hintText: hintText,
        hintStyle: TextStyle(color: textColor ?? ColorConstants.lightGrey2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rad ?? 0),
          borderSide: BorderSide(color: ColorConstants.lightGrey3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rad ?? 0),
          borderSide: BorderSide(color: ColorConstants.lightGrey3),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rad ?? 0),
          borderSide: BorderSide(color: ColorConstants.lightGrey3),
        ),
      ),

      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
