import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/models/resource-category.dart';
import 'package:hhah/services/care_giver_service.dart';
import 'package:hhah/core/storage/secure_storage.dart';
import 'package:hhah/models/resource-model.dart';

class TutorialsForChildCareNeeds extends StatelessWidget {
  const TutorialsForChildCareNeeds({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

  final Map<String, List<String>> menuOptions = const {
    "formula": ["Formula Mixes", "خليط الصيغة"],
    "medication": ["Medication", "الأدوية"],
    "drain": ["Drain Care", "رعاية الصرف"],
    "wound": ["Wound Care", "رعاية الجروح"],
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListButton(
            text: menuOptions["formula"]![isEnglish ? 0 : 1],
            onPressed: () =>
                getResourcesAndTransition(ScreenType.formulaMixes, 4),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["medication"]![isEnglish ? 0 : 1],
            onPressed: () =>
                getResourcesAndTransition(ScreenType.medicationTutorials, 5),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["drain"]![isEnglish ? 0 : 1],
            onPressed: () => getResourcesAndTransition(ScreenType.drainCare, 6),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["wound"]![isEnglish ? 0 : 1],
            onPressed: () => getResourcesAndTransition(ScreenType.woundCare, 7),
          ),
          SizedBox(height: 50),
          BackToButton(onPressed: () => switchScreen(ScreenType.mainMenu)),
        ],
      ),
    );
  }
}
