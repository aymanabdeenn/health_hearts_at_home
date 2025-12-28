import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/screens/admin-screens/admin-main-menu.dart';
import 'package:hhah/screens/care-giver-screens/caregiver-support-screens/personal_contacts.dart';
import 'package:hhah/screens/care-giver-screens/main_menu.dart';
import 'package:hhah/screens/care-giver-screens/about_chd_and_treatment_menu.dart';
import 'package:hhah/screens/care-giver-screens/track-your-child-screens/blood-pressure.dart';
import 'package:hhah/screens/care-giver-screens/track-your-child-screens/body-weight.dart';
import 'package:hhah/screens/care-giver-screens/track-your-child-screens/ox-pulse.dart';
import 'package:hhah/screens/care-giver-screens/tutorials_for_child_care_needs.dart';
import 'package:hhah/screens/care-giver-screens/spiritual_needs.dart';
import 'package:hhah/screens/care-giver-screens/hospital_info.dart';
import 'package:hhah/screens/care-giver-screens/caregiver.dart';
import 'package:hhah/screens/care-giver-screens/track_your_child.dart';
import 'package:hhah/screens/care-giver-screens/general_child_care_info.dart';
import 'package:hhah/screens/auth-screens/login-page.dart';
import 'package:hhah/screens/auth-screens/signup-page.dart';
import 'package:hhah/screens/admin-screens/add-resource.dart';
import 'package:hhah/screens/admin-screens/update-child-info.dart';
import 'package:hhah/screens/care-giver-screens/about-chd-screens/links-to-websites.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/screens/care-giver-screens/about-chd-screens/videos-of-defects.dart';
import 'package:hhah/screens/care-giver-screens/about-chd-screens/library-of-defects.dart';
import 'package:hhah/screens/care-giver-screens/about-chd-screens/medications.dart';
import 'package:hhah/screens/care-giver-screens/tutorials-screens/formula-mixes.dart';
import 'package:hhah/screens/care-giver-screens/tutorials-screens/medication-tutorials.dart';
import 'package:hhah/screens/care-giver-screens/tutorials-screens/drain-care.dart';
import 'package:hhah/screens/care-giver-screens/tutorials-screens/wound-care.dart';
import 'package:hhah/screens/care-giver-screens/spiritual-screens/devotionals.dart';
import 'package:hhah/screens/care-giver-screens/spiritual-screens/resources.dart';
import 'package:hhah/screens/care-giver-screens/hospital-helpline-screens/weblinks.dart';
import 'package:hhah/screens/care-giver-screens/hospital-helpline-screens/area-map.dart';
import 'package:hhah/screens/care-giver-screens/hospital-helpline-screens/hospital-showers.dart';
import 'package:hhah/screens/care-giver-screens/hospital-helpline-screens/cafeteria-menu.dart';
import 'package:hhah/screens/care-giver-screens/caregiver-support-screens/support-groups.dart';
import 'package:hhah/screens/care-giver-screens/general-child-care-screens/library-of-information.dart';
import 'package:hhah/services/auth_service.dart';

class Hhah extends StatefulWidget {
  const Hhah({super.key});

  @override
  State<Hhah> createState() => _HhahState();
}

class _HhahState extends State<Hhah> {
  ScreenType? activeScreen;
  bool isEnglish = true;

  List<ResourceModel> resources = [];

  int _themeIndex = 0;

  void updateResources(List<ResourceModel> newResources) {
    setState(() {
      resources = newResources;
    });
  }

  void _cycleTheme() {
    setState(() {
      _themeIndex = (_themeIndex + 1) % 2;

      switch (_themeIndex) {
        case 0: // Original
          AppColors.primaryBGColor = const Color.fromARGB(255, 202, 240, 248);
          AppColors.secondaryBGColor = const Color.fromARGB(255, 0, 180, 216);
          AppColors.tertiaryBGColor = const Color.fromARGB(255, 3, 4, 94);
          AppColors.textColor = const Color.fromARGB(255, 202, 240, 248);
          break;
        case 1: // Dark Theme
          AppColors.primaryBGColor = const Color(0xFFFFFFFF);
          AppColors.secondaryBGColor = const Color(0xFF252525);
          AppColors.tertiaryBGColor = const Color(0xFF333333);
          AppColors.textColor = const Color(0xFFFFFFFF);

          break;
      }
    });
  }

  void switchScreen(ScreenType screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  Widget _buildActiveScreen() {
    switch (activeScreen) {
      // Auth Screens
      case ScreenType.loginPage:
        return LoginPage(switchScreen: switchScreen, isEnglish: isEnglish);
      case ScreenType.signupPage:
        return SignupPage();
      // Addmin Screens
      case ScreenType.adminMainMenu:
        return AdminMainMenu(switchScreen: switchScreen, isEnglish: isEnglish);
      case ScreenType.addResource:
        return AddResource(isEnglish: isEnglish, switchScreen: switchScreen);
      case ScreenType.update:
        return UpdateChildInfo(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
        );
      // Caregiver Screens
      case ScreenType.mainMenu:
        return MainMenu(switchScreen: switchScreen, isEnglish: isEnglish);
      case ScreenType.aboutChdAndTreatment:
        return AboutChdAndTreatmentMenu(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );
      case ScreenType.tutorialsForChildCareNeeds:
        return TutorialsForChildCareNeeds(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );
      case ScreenType.spiritualNeeds:
        return SpiritualNeeds(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );
      case ScreenType.hospitalInfo:
        return HospitalInfo(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );
      case ScreenType.caregiverSupport:
        return CaregiverSupport(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );
      case ScreenType.trackYourChild:
        return TrackYourChild(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );

      case ScreenType.generalChildCareInfo:
        return GeneralChildCareInfo(
          isEnglish: isEnglish,
          switchScreen: switchScreen,
          updateResources: updateResources,
        );

      // Care giver Subscreens
      case ScreenType.personalContacts:
        return PersonalContacts(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
        );

      // generalChildCareInfo screens
      case ScreenType.linksToReliableWebsites:
        return LinksToWebsites(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );

      case ScreenType.videosOfDefectsAndTreatments:
        return VidoesOfDefects(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );

      case ScreenType.libraryOfDefectsAndTreatements:
        return LibraryOfDefects(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );

      case ScreenType.medications:
        return Medications(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      // TutorialsForChildCareNeeds screens
      case ScreenType.formulaMixes:
        return FormualMixes(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );

      case ScreenType.medicationTutorials:
        return MedicationTutorials(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      case ScreenType.drainCare:
        return DrainCare(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      case ScreenType.woundCare:
        return WoundCare(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );

      // spiritual
      case ScreenType.devotionals:
        return Devotionals(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          title: 'Devotionals',
          text: 'التفاني',
        );

      case ScreenType.resources:
        return Resources(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      // hospital helpline
      case ScreenType.weblinks:
        return WebLinks(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      case ScreenType.areaMap:
        return AreaMap(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      case ScreenType.hospitalShowers:
        return HospitalShowers(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      case ScreenType.cafeteriaMenu:
        return CafeteriaMenu(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );
      // track your child
      case ScreenType.bloodPressure:
        return BloodPressure(switchScreen: switchScreen, isEnglish: isEnglish);
      case ScreenType.weight:
        return BodyWeight(switchScreen: switchScreen, isEnglish: isEnglish);
      case ScreenType.pulseOx:
        return OxygenPulse(switchScreen: switchScreen, isEnglish: isEnglish);
      // careGiver support
      case ScreenType.supportGroups:
        return SupportGroups(switchScreen: switchScreen, isEnglish: isEnglish);
      // general child care information
      case ScreenType.libraryOfInformation:
        return LibraryOfInformation(
          switchScreen: switchScreen,
          isEnglish: isEnglish,
          resources: resources,
        );

      // Add other cases for different screens here
      default:
        return LoginPage(switchScreen: switchScreen, isEnglish: isEnglish);
    }
  }

  void switchLang() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  void logout() {
    setState(() {
      AuthService.logout();
      switchScreen(ScreenType.loginPage);
    });
  }

  bool _shouldShowAppBar() {
    return activeScreen != null &&
        activeScreen != ScreenType.loginPage &&
        activeScreen != ScreenType.signupPage;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _shouldShowAppBar()
            ? AppBar(
                backgroundColor: AppColors.secondaryBGColor,
                title: Text(
                  "Health Hearts at Home",
                  style: GoogleFonts.dancingScript(
                    color: AppColors.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: _cycleTheme,
                    icon: Icon(
                      Icons.color_lens,
                      color: AppColors.primaryBGColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: switchLang,
                    icon: Icon(
                      Icons.language,
                      color: AppColors.primaryBGColor,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: logout,
                    icon: Icon(
                      Icons.logout,
                      color: AppColors.primaryBGColor,
                      size: 30,
                    ),
                  ),
                ],
              )
            : null,
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
