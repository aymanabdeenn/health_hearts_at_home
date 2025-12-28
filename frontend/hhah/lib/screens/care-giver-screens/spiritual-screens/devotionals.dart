import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/screens/care-giver-screens/spiritual-screens/devotionalsList.dart';
import 'package:hhah/widgets/shared/resources_list.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/screens/care-giver-screens/spiritual-screens/devotionals_element.dart';

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

  @override
  Widget build(BuildContext context) {
    // Choose the appropriate data set based on current language
    final devotionalsData = isEnglish ? EnglishDevotionals : ArabicDevotionals;

    // Map data entries to DevotionalsElement widgets
    final devotionalWidgets = List<Widget>.generate(devotionalsData.length, (
      i,
    ) {
      final titleText = devotionalsData[i][0][1] as String;
      final bodyText = devotionalsData[i][1][1] as String;
      return DevotionalsElement(title: titleText, text: bodyText);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(isEnglish ? title : text),
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.spiritualNeeds),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Expanded(child: ListView(children: devotionalWidgets)),
            ],
          ),
        ),
      ),
    );
  }
}
