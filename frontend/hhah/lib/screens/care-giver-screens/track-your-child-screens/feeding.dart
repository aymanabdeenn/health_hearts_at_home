import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedingSchedule extends StatelessWidget {
  const FeedingSchedule({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;

  @override
  Widget build(BuildContext context) {
    // Example Schedule Data
    final List<Map<String, dynamic>> scheduleData = [
      {
        'time': '08:00 AM',
        'type': isEnglish ? 'Milk' : 'حليب',
        'amount': '150 ml',
      },
      {
        'time': '11:30 AM',
        'type': isEnglish ? 'Cereal' : 'حبوب',
        'amount': '50 g',
      },
      {
        'time': '02:00 PM',
        'type': isEnglish ? 'Milk' : 'حليب',
        'amount': '120 ml',
      },
      {
        'time': '05:00 PM',
        'type': isEnglish ? 'Fruit' : 'فاكهة',
        'amount': '60 g',
      },
    ];

    return Scaffold(
      // Restored original AppBar
      appBar: AppBar(
        // title: Text(isEnglish ? 'Feeding Schedule' : 'جدول التغذية'),
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
                  Icons.calendar_month_rounded,
                  size: 60,
                  color: Colors.white.withOpacity(0.9),
                ),
                const SizedBox(height: 10),
                Text(
                  isEnglish ? 'Feeding Schedule' : 'جدول التغذية',
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
                        isEnglish ? 'Today\'s Logs' : 'سجلات اليوم',
                        style: GoogleFonts.oswald(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Schedule List
                      ...scheduleData.map((item) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              // Time Box
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBGColor.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item['time'],
                                  style: GoogleFonts.oswald(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBGColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Type
                              Expanded(
                                child: Text(
                                  item['type'],
                                  style: GoogleFonts.oswald(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),

                              // Amount
                              Text(
                                item['amount'],
                                style: GoogleFonts.oswald(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      const Divider(),
                      const SizedBox(height: 10),

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
                              isEnglish ? 'Status: Up to date' : 'الحالة: محدث',
                              style: GoogleFonts.oswald(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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
