import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/widgets/shared/list_button.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? 'Track Your Child' : 'تتبع طفلك'),
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
            ],
          ),
        ),
      ),
    );
  }
}
