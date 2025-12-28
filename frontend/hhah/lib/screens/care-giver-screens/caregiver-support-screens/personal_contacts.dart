import 'package:flutter/material.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/screens/care-giver-screens/caregiver-support-screens/personal_contact_element.dart';

class PersonalContacts extends StatelessWidget {
  const PersonalContacts({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
  });

  final bool isEnglish;
  final void Function(ScreenType screen) switchScreen;

  // List of contacts: localized label + list of phone numbers
  final List<Map<String, dynamic>> personalContacts = const [
    {
      'label': ['Emergency Services', 'الطوارئ'],
      'numbers': ['911'],
    },
    {
      'label': ['Abdali Hospital', 'مستشفى العبدلي'],
      'numbers': ['+962 6 510 9999', '+962 6 510 9990'],
      'icon': Icons.local_hospital,
    },
    {
      'label': [
        'Queen Alia Heart Institute (Royal Medical Services)',
        'معهد الملكة عالية للقلب (الخدمة الطبية الملكية)',
      ],
      'numbers': ['+962 6 580 4804'],
      'icon': Icons.local_hospital,
    },
    {
      'label': ['Al Khalidi Hospital', 'مستشفى الخالدي'],
      'numbers': ['+962 6 464 4281', '+962 79 099 8227', '+962 79 199 0199'],
      'icon': Icons.local_hospital,
    },
    {
      'label': ['The Specialty Hospital', 'المستشفى التخصصي'],
      'numbers': ['+962 6 200 1111'],
      'icon': Icons.local_hospital,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.caregiverSupport),
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
              Expanded(
                child: ListView.separated(
                  itemCount: personalContacts.length,
                  separatorBuilder: (_, __) => Divider(
                    color: AppColors.tertiaryBGColor.withOpacity(0.18),
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    final entry = personalContacts[index];
                    final label = isEnglish
                        ? entry['label'][0] as String
                        : entry['label'][1] as String;
                    final numbers = List<String>.from(entry['numbers'] as List);
                    final icon = entry.containsKey('icon')
                        ? entry['icon'] as IconData
                        : Icons.contact_phone;
                    return PersonalContactElement(
                      icon: icon,
                      label: label,
                      numbers: numbers,
                      onTap: () {
                        // Implement call functionality here if needed
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
