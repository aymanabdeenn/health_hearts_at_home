import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/models/resource-category.dart';
import 'package:hhah/services/care_giver_service.dart';

class TrackYourChild extends StatelessWidget {
  const TrackYourChild({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

  final Map<String, List<String>> menuOptions = const {
    "feeding": ["Feeding", "التغذية"],
    "weight": ["Weight", "الوزن"],
    "bloodPressure": ["Blood Pressure", "ضغط الدم"],
    "pulseOx": ["Pulse Ox", "تشبع الأكسجين"],
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
            text: menuOptions["feeding"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["weight"]![isEnglish ? 0 : 1],
            onPressed: () => switchScreen(ScreenType.weight),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["bloodPressure"]![isEnglish ? 0 : 1],
            onPressed: () => switchScreen(ScreenType.bloodPressure),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["pulseOx"]![isEnglish ? 0 : 1],
            onPressed: () => switchScreen(ScreenType.pulseOx),
          ),
          SizedBox(height: 50),
          BackToButton(onPressed: () => switchScreen(ScreenType.mainMenu)),
        ],
      ),
    );
  }
}
