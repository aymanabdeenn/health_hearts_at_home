import 'package:flutter/material.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/widgets/shared/resources_list.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/screens/care-giver-screens/tutorials_for_child_care_needs.dart';

class DrainCare extends StatelessWidget {
  const DrainCare({
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
            title: isEnglish ? 'Drain Care ' : 'العناية بالصرف',
          ),
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
