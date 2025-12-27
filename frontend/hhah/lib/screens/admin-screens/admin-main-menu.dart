import 'package:flutter/material.dart';
import 'package:hhah/widgets/main_menu_widgets/main_menu_button.dart';
import 'package:hhah/navigation/screen_types.dart';

class AdminMainMenu extends StatelessWidget {
  const AdminMainMenu({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;

  final Map<String, List<String>> menuOptions = const {
    "addResource": ["Add Resource", "إضافة مورد"],
    "update": ["Update child's info", "تحديث معلومات الطفل"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainMenuButton(
            label: menuOptions["addResource"]![isEnglish ? 0 : 1],
            icon: Icon(Icons.add),
            onPressed: () => switchScreen(ScreenType.addResource),
          ),
          SizedBox(height: 20),
          MainMenuButton(
            label: menuOptions["update"]![isEnglish ? 0 : 1],
            icon: Icon(Icons.update),
            onPressed: () => switchScreen(ScreenType.update),
          ),
        ],
      ),
    );
  }
}
