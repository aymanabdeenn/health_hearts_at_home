import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:google_fonts/google_fonts.dart';

class BloodPressure extends StatelessWidget {
  const BloodPressure({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(isEnglish ? 'Current Blood Pressure' : 'ضغط الدم الحالي'),
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
                  isEnglish ? 'Current Blood Pressure' : 'ضغط الدم الحالي',
                  style: GoogleFonts.oswald(fontSize: 24),
                ),

                const SizedBox(height: 30),

                // Main reading
                Text(
                  '120 / 80',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('mmHg'),

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
                      ? 'This is the most recent blood pressure reading for your child.'
                      : 'هذا هو آخر قياس لضغط دم طفلك',
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
