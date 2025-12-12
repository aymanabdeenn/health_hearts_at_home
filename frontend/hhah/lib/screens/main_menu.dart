import 'package:flutter/material.dart';
import 'package:hhah/modules/main_menu_widgets/main_menu_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
    required this.switchScreen,
    required this.backgroundColors,
    required this.isEnglish,
  });

  final void Function(Widget screen) switchScreen;
  final Map<String, Color> backgroundColors;
  final bool isEnglish;

  final Map<String, List<String>> menuOptions = const {
    "about": ["About CHD and Treatment", "حول عيوب القلب الخلقية والعلاج"],
    "tutorials": [
      "Tutorials for Child Care Needs",
      "دروس لاحتياجات رعاية الطفل",
    ],
    "spiritual": ["Spiritual Needs", "الاحتياجات الروحية"],
    "helpline": ["Hospital Helpline", "خط المساعدة بالمستشفى"],
    "support": ["Caregiver Support", "دعم مقدم الرعاية"],
    "track": ["Track Your Child", "تتبع طفلك"],
    "info": ["General Child Care Information", "معلومات عامة عن رعاية الطفل"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainMenuButton(
            label: menuOptions["about"]![isEnglish ? 0 : 1],
            icon: Icon(Icons.question_mark),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions["tutorials"]![isEnglish ? 0 : 1],
            icon: Icon(Icons.featured_video),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions['spiritual']![isEnglish ? 0 : 1],
            icon: Icon(Icons.shelves),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions['helpline']![isEnglish ? 0 : 1],
            icon: Icon(Icons.local_hospital),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions['support']![isEnglish ? 0 : 1],
            icon: Icon(Icons.back_hand),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions['track']![isEnglish ? 0 : 1],
            icon: Icon(Icons.boy),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions['info']![isEnglish ? 0 : 1],
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
