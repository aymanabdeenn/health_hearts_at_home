import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/models/resource-category.dart';
import 'package:hhah/services/care_giver_service.dart';

class HospitalInfo extends StatelessWidget {
  const HospitalInfo({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
    required this.updateResources,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;
  final void Function(List<ResourceModel> newResources) updateResources;

  final Map<String, List<String>> menuOptions = const {
    "weblinks": ["WebLinks", "روابط الويب"],
    "areaMap": ["Area Map", "خريطة المنطقة"],
    "hospitalShowers": ["Hospital Showers", "دشات المستشفى"],
    "cafeteriaMenu": ["Cafeteria Menu", "قائمة المطعم"],
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
        title: Text(isEnglish ? 'Hospital Info' : 'معلومات المستشفى'),
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.mainMenu),
        ),
      ),
      body: Container(
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
                text: menuOptions["weblinks"]![isEnglish ? 0 : 1],
                onPressed: () =>
                    getResourcesAndTransition(ScreenType.weblinks, 10),
              ),
              SizedBox(height: 20),
              ListButton(
                text: menuOptions["areaMap"]![isEnglish ? 0 : 1],
                onPressed: () =>
                    getResourcesAndTransition(ScreenType.areaMap, 11),
              ),
              SizedBox(height: 20),
              ListButton(
                text: menuOptions["hospitalShowers"]![isEnglish ? 0 : 1],
                onPressed: () =>
                    getResourcesAndTransition(ScreenType.hospitalShowers, 12),
              ),
              SizedBox(height: 20),
              ListButton(
                text: menuOptions["cafeteriaMenu"]![isEnglish ? 0 : 1],
                onPressed: () =>
                    getResourcesAndTransition(ScreenType.cafeteriaMenu, 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
