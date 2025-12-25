import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';

class AboutChdAndTreatmentMenu extends StatelessWidget {
  const AboutChdAndTreatmentMenu({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;

  final Map<String, List<String>> menuOptions = const {
    "links": ["Links to reliable websites", "روابط لمواقع موثوقة"],
    "videos": [
      "Videos of defects and treatments",
      "مقاطع فيديو للعيوب والعلاجات",
    ],
    "library": ["Library of defects and treatements", "مكتبة العيوب والعلاجات"],
    "medications": ["Medications", "الأدوية"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListButton(
            text: menuOptions["links"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["videos"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["library"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["medications"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 50),
          BackToButton(onPressed: () => switchScreen(ScreenType.mainMenu)),
        ],
      ),
    );
  }
}
