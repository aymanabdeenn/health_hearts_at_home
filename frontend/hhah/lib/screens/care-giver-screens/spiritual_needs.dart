import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/services/care_giver_service.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/models/resource-category.dart';

class SpiritualNeeds extends StatelessWidget {
  const SpiritualNeeds({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

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

  final Map<String, List<String>> menuOptions = const {
    "devotionals": ["Devotionals", "العبادات"],
    "resources": ["Resources", "الموارد"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListButton(
            text: menuOptions["devotionals"]![isEnglish ? 0 : 1],
            onPressed: () =>
                getResourcesAndTransition(ScreenType.devotionals, 8),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["resources"]![isEnglish ? 0 : 1],
            onPressed: () => getResourcesAndTransition(ScreenType.resources, 9),
          ),
          SizedBox(height: 50),
          BackToButton(onPressed: () => switchScreen(ScreenType.mainMenu)),
        ],
      ),
    );
  }
}
