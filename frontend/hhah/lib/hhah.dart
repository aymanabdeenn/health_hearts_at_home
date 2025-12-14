import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/screens/main_menu.dart';

class Hhah extends StatefulWidget {
  const Hhah({super.key});

  @override
  State<Hhah> createState() => _HhahState();
}

class _HhahState extends State<Hhah> {
  Widget? activeScreen;
  bool isEnglish = true;

  void switchScreen(Widget screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void switchLang() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondaryBGColor,
          title: Text(
            "Health Hearts at Home",
            style: GoogleFonts.oswald(
              color: AppColors.primaryBGColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: switchLang,
              icon: Icon(
                Icons.language,
                color: AppColors.primaryBGColor,
                size: 30,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryBGColor, AppColors.secondaryBGColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen ??
              MainMenu(switchScreen: switchScreen, isEnglish: isEnglish),
        ),
      ),
    );
  }
}
