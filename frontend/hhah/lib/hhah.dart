import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/screens/main_menu.dart';
import 'package:hhah/screens/about_chd_and_treatment_menu.dart';
import 'package:hhah/screens/tutorials_for_child_care_needs.dart';
import 'package:hhah/screens/spiritual_needs.dart';
import 'package:hhah/screens/hospital_info.dart';

class Hhah extends StatefulWidget {
  const Hhah({super.key});

  @override
  State<Hhah> createState() => _HhahState();
}

class _HhahState extends State<Hhah> {
  ScreenType? activeScreen;
  bool isEnglish = true;

  void switchScreen(ScreenType screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  Widget _buildActiveScreen() {
    switch (activeScreen) {
      case ScreenType.mainMenu:
        return MainMenu(switchScreen: switchScreen, isEnglish: isEnglish);
      case ScreenType.aboutChdAndTreatment:
        return AboutChdAndTreatmentMenu(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
        );
      case ScreenType.tutorialsForChildCareNeeds:
        return TutorialsForChildCareNeeds(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
        );
      case ScreenType.spiritualNeeds:
        return SpiritualNeeds(isEnglish: isEnglish, switchScreen: switchScreen);
      case ScreenType.hospitalInfo:
        return HospitalInfo(isEnglish: isEnglish, switchScreen: switchScreen);

      // Add other cases for different screens here
      default:
        return MainMenu(switchScreen: switchScreen, isEnglish: isEnglish);
    }
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
          child: _buildActiveScreen(),
        ),
      ),
    );
  }
}
