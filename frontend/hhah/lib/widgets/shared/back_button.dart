import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';

class BackToButton extends StatelessWidget {
  const BackToButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBGColor,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: CircleBorder(),
      ),

      child: Icon(Icons.arrow_back, size: 30, color: AppColors.tertiaryBGColor),
    );
  }
}
