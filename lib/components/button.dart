import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
  });

  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: primaryColor,
          elevation: 0,
          minimumSize: Size(width ?? 200, height ?? 45),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ));
  }
}
