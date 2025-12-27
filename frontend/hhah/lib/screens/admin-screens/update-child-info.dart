import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/widgets/shared/back_button.dart';
import 'package:hhah/navigation/screen_types.dart';

class UpdateChildInfo extends StatelessWidget {
  const UpdateChildInfo({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;

  final Map<String, List<String>> menuOptions = const {
    "weblinks": ["WebLinks", "روابط الويب"],
    "areaMap": ["Area Map", "خريطة المنطقة"],
    "hospitalShowers": ["Hospital Showers", "دشات المستشفى"],
    "cafeteriaMenu": ["Cafeteria Menu", "قائمة المطعم"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
