import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/services/care_giver_service.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/models/resource-category.dart';
import 'package:hhah/services/care_giver_service.dart';
import 'package:hhah/core/storage/secure_storage.dart';
import 'package:hhah/models/resource-model.dart';

class AboutChdAndTreatmentMenu extends StatelessWidget {
  const AboutChdAndTreatmentMenu({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

  final Map<String, List<String>> menuOptions = const {
    "links": ["Links to reliable websites", "روابط لمواقع موثوقة"],
    "videos": [
      "Videos of defects and treatments",
      "مقاطع فيديو للعيوب والعلاجات",
    ],
    "library": ["Library of defects and treatements", "مكتبة العيوب والعلاجات"],
    "medications": ["Medications", "الأدوية"],
  };

  void getResourcesAndTransition(
    ScreenType screenType,
    int categoryIndex,
  ) async {
    final resources = await CareGiverService.getResourcesViaLanguageAndCategory(
      language: isEnglish ? 'EN' : 'AR',
      category: categories[categoryIndex],
    );
    updateResources(resources);
    switchScreen(screenType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? 'About CHD & Treatment' : 'حول العيوب والعلاج'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.mainMenu),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              // these are provided by Hhah, but we duplicate here for independent screens
              // so each screen matches the main menu background
              // AppColors values are dynamic; use runtime values below
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryBGColor, AppColors.secondaryBGColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListButton(
                  text: menuOptions["links"]![isEnglish ? 0 : 1],
                  onPressed: () => getResourcesAndTransition(
                    ScreenType.linksToReliableWebsites,
                    0,
                  ),
                ),
                SizedBox(height: 20),
                ListButton(
                  text: menuOptions["videos"]![isEnglish ? 0 : 1],
                  onPressed: () => getResourcesAndTransition(
                    ScreenType.videosOfDefectsAndTreatments,
                    1,
                  ),
                ),
                SizedBox(height: 20),
                ListButton(
                  text: menuOptions["library"]![isEnglish ? 0 : 1],
                  onPressed: () => getResourcesAndTransition(
                    ScreenType.libraryOfDefectsAndTreatements,
                    2,
                  ),
                ),
                SizedBox(height: 20),
                ListButton(
                  text: menuOptions["medications"]![isEnglish ? 0 : 1],
                  onPressed: () =>
                      getResourcesAndTransition(ScreenType.medications, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
