import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyWeight extends StatelessWidget {
  const BodyWeight({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    // Example weight value (replace later with real data)
    final double weightKg = 24.5;

    return Scaffold(
      appBar: AppBar(
        //title: Text(isEnglish ? 'Current Body Weight' : 'الوزن الحالي'),
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.trackYourChild),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  isEnglish ? 'Current Body Weight' : 'الوزن الحالي',
                  style: GoogleFonts.oswald(fontSize: 24),
                ),

                const SizedBox(height: 30),

                // Main reading
                Text(
                  weightKg.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(isEnglish ? 'kg' : 'كغم'),

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
                      ? 'Your child\'s weight has been recorded successfully.'
                      : 'تم تسجيل وزن الطفل بنجاح.',
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
