import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });
  final Icon icon;
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(325, 50),
        backgroundColor: AppColors.tertiaryBGColor,
        foregroundColor: AppColors.primaryBGColor,
        iconSize: 24,
        alignment: Alignment.centerLeft,
        textStyle: TextStyle(fontSize: 16),
      ),
      onPressed: onPressed,
      icon: Padding(padding: EdgeInsets.only(right: 10), child: icon),
      label: Text(
        label,
        style: GoogleFonts.oswald(
          color: AppColors.primaryBGColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
