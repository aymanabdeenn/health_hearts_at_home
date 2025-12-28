import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/models/resource-category.dart';
import 'package:hhah/services/care_giver_service.dart';

class GeneralChildCareInfo extends StatelessWidget {
  const GeneralChildCareInfo({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

  final Map<String, List<String>> menuOptions = const {
    "libraryofInfo": ["Library of Information", "مكتبة المعلومات"],
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
            text: menuOptions["libraryofInfo"]![isEnglish ? 0 : 1],
            onPressed: () =>
                getResourcesAndTransition(ScreenType.libraryOfInformation, 15),
          ),
          SizedBox(height: 50),
          BackToButton(onPressed: () => switchScreen(ScreenType.mainMenu)),
        ],
      ),
    );
  }
}
