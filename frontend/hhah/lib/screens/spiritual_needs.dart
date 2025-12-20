import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/navigation/screen_types.dart';

class SpiritualNeeds extends StatelessWidget {
  const SpiritualNeeds({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;

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
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["resources"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
