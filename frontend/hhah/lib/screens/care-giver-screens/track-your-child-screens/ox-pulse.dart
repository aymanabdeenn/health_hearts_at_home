import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
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

    return Scaffold(
      // Restored original AppBar
      appBar: AppBar(
        // title: Text(isEnglish ? 'Current Oxygen Saturation' : 'مستوى تشبع الأكسجين الحالي'),
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.trackYourChild),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryBGColor, AppColors.secondaryBGColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Icon(
                  Icons.water_drop_rounded,
                  size: 60,
                  color: Colors.white.withOpacity(0.9),
                ),
                const SizedBox(height: 10),
                Text(
                  isEnglish ? 'Oxygen Saturation' : 'تشبع الأكسجين',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.oswald(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Main Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        isEnglish ? 'Current Level' : 'المستوى الحالي',
                        style: GoogleFonts.oswald(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Value
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '$oxygenLevel',
                            style: GoogleFonts.oswald(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBGColor,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                              left: 4,
                            ),
                            child: Text(
                              '%',
                              style: GoogleFonts.oswald(
                                fontSize: 30,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),

                      // Status Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 16,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isEnglish ? 'Status: Recent' : 'الحالة: حديث',
                              style: GoogleFonts.oswald(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Guidance
                      Text(
                        isEnglish
                            ? 'This is your child’s latest oxygen saturation reading.'
                            : 'هذا هو آخر قياس لتشبع الأكسجين لدى طفلك.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600], height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
