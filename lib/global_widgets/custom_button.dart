import 'package:flutter/material.dart';
import 'package:my_study_life/utils/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color bgColor;
  final Color textColor;
  final void Function() onButtonPressed;
  const CustomButton({
    super.key,
    required this.buttonText,
    this.bgColor = ColorConstants.buttonBlue,
    this.textColor = Colors.white,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonPressed,
      child: Container(
        width: 320,
        height: 40,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorConstants.buttonBlue),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
