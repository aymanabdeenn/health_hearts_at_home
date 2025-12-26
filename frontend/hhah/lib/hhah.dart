import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/screens/care-giver-screens/main_menu.dart';
import 'package:hhah/screens/care-giver-screens/about_chd_and_treatment_menu.dart';
import 'package:hhah/screens/care-giver-screens/tutorials_for_child_care_needs.dart';
import 'package:hhah/screens/care-giver-screens/spiritual_needs.dart';
import 'package:hhah/screens/care-giver-screens/hospital_info.dart';
import 'package:hhah/screens/care-giver-screens/caregiver.dart';
import 'package:hhah/screens/care-giver-screens/track_your_child.dart';
import 'package:hhah/screens/care-giver-screens/general_child_care_info.dart';
import 'package:hhah/screens/auth-screens/login-page.dart';

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
      case ScreenType.caregiverSupport:
        return CaregiverSupport(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
        );
      case ScreenType.trackYourChild:
        return TrackYourChild(isEnglish: isEnglish, switchScreen: switchScreen);

      case ScreenType.generalChildCareInfo:
        return GeneralChildCareInfo(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
        );
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryBGColor,
        title: Text(
          "Health Hearts at Home",
          style: GoogleFonts.dancingScript(
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
    );
  }
}
