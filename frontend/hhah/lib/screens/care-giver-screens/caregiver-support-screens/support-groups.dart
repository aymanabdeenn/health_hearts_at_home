import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/widgets/shared/resource_element.dart';
import 'package:hhah/widgets/shared/resources_list.dart';

class SupportGroups extends StatelessWidget {
  const SupportGroups({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.caregiverSupport),
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
            children: [
              ResourcesElement(
                type: "GROUP",
                link:
                    "https://www.google.com/search?q=https://www.facebook.com/MendedLittleHeartsNational/",
                title: "Mended Little Hearts (National)",
              ),
              ResourcesElement(
                type: "GROUP",
                link:
                    "https://www.google.com/search?q=https://www.facebook.com/groups/HeartMoms/",
                title: "Heart Moms (CHD Support)",
              ),
              ResourcesElement(
                type: "GROUP",
                link:
                    "https://www.google.com/search?q=https://www.facebook.com/ConqueringCHD/",
                title: "Conquering CHD",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
