import 'package:flutter/material.dart';

class ReusablebackButton extends StatelessWidget {
  const ReusablebackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Colors.white,
      ),
    );
  }
}
