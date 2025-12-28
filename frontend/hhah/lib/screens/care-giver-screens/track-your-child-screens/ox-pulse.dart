import 'package:flutter/material.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:google_fonts/google_fonts.dart';

class OxygenPulse extends StatelessWidget {
  const OxygenPulse({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    final int oxygenLevel = 97;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            Text(
              isEnglish
                  ? 'Current Oxygen Saturation'
                  : 'مستوى تشبع الأكسجين الحالي',
              style: GoogleFonts.oswald(fontSize: 24),
            ),

            const SizedBox(height: 30),

            // Main reading
            Text(
              '$oxygenLevel%',
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Status
            Text(
              isEnglish ? 'Status: Recent' : 'الحالة: حديث',
              style: GoogleFonts.oswald(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // Guidance
            Text(
              isEnglish
                  ? 'This is your child’s latest oxygen saturation reading.'
                  : 'هذا هو آخر قياس لتشبع الأكسجين لدى طفلك.',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            BackButton(
              onPressed: () => switchScreen(ScreenType.trackYourChild),
            ),
          ],
        ),
      ),
    );
  }
}
