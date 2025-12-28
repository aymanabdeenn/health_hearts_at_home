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
    required this.resources,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;
  final List<ResourceModel> resources;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ResourcesList(
            resources: resources,
            title: isEnglish ? 'Devotionals' : 'التأملات',
          ),
          SizedBox(height: 50),
          BackToButton(
            onPressed: () => switchScreen(ScreenType.spiritualNeeds),
          ),
        ],
      ),
    );
  }
}
