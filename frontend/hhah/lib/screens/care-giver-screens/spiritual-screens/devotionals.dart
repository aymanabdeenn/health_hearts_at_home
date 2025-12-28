import 'package:flutter/material.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/widgets/shared/resources_list.dart';
import 'package:hhah/widgets/shared/back_button.dart';

class Devotionals extends StatelessWidget {
  const Devotionals({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
    required this.title,
    required this.text,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;
  final String title;
  final String text;

  final Map<String, List<String>> menuOptions = const {
    "devotionals1": ["Devotionals", "العبادات"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Container(
            color: Colors.white, // or some contrasting color to reveal layout
            padding: EdgeInsets.all(8),
            child: BackToButton(
              onPressed: () => switchScreen(ScreenType.spiritualNeeds),
            ),
          ),
        ],
      ),
    );
  }
}
