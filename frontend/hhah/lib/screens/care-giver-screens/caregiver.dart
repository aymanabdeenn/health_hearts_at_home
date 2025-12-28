import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/models/resource-category.dart';
import 'package:hhah/services/care_giver_service.dart';

class CaregiverSupport extends StatelessWidget {
  const CaregiverSupport({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

  final Map<String, List<String>> menuOptions = const {
    "SupportGroups": ["Support Groups", "مجموعات الدعم"],
    "PersonalContacts": ["Personal Contacts", "جهات الاتصال الشخصية"],
    "Contacts": ["Contacts", "جهات الاتصال"],
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
            text: menuOptions["SupportGroups"]![isEnglish ? 0 : 1],
            onPressed: () =>
                getResourcesAndTransition(ScreenType.supportGroups, 14),
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["PersonalContacts"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["Contacts"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 50),
          BackToButton(onPressed: () => switchScreen(ScreenType.mainMenu)),
        ],
      ),
    );
  }
}
