import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';

class ListButton extends StatelessWidget {
  const ListButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(325, 50),
        backgroundColor: AppColors.tertiaryBGColor,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      child: Text(
        text,
        style: GoogleFonts.oswald(
          color: AppColors.primaryBGColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
