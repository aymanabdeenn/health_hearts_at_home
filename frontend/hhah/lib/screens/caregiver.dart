import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/list_button.dart';
import 'package:hhah/navigation/screen_types.dart';

class CaregiverSupport extends StatelessWidget {
  const CaregiverSupport({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;

  final Map<String, List<String>> menuOptions = const {
    "SupportGroups": ["Support Groups", "مجموعات الدعم"],
    "PersonalContacts": ["Personal Contacts", "جهات الاتصال الشخصية"],
    "Contacts": ["Contacts", "جهات الاتصال"],
  };

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListButton(
            text: menuOptions["SupportGroups"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["PersonalContacts"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
          ListButton(
            text: menuOptions["Contacts"]![isEnglish ? 0 : 1],
            onPressed: () {},
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
