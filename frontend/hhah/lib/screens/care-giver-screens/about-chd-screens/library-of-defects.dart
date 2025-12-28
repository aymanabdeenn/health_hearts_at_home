import 'package:flutter/material.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/widgets/shared/resources_list.dart';

class LibraryOfDefects extends StatelessWidget {
  const LibraryOfDefects({
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
      child: ResourcesList(
        resources: resources,
        title: (isEnglish)
            ? 'Library of Defects and Treatments'
            : 'مكتبة العيوب والعلاجات',
      ),
    );
  }
}
