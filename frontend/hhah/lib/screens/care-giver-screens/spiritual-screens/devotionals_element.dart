import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';

class DevotionalsElement extends StatelessWidget {
  const DevotionalsElement({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    // Detect Arabic characters to switch alignment and direction
    final bool isArabic = RegExp(r'[\u0600-\u06FF]').hasMatch('$title $text');

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: AppColors.primaryBGColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Column(
            crossAxisAlignment: isArabic
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.book, color: AppColors.tertiaryBGColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.tertiaryBGColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Divider(
                color: AppColors.tertiaryBGColor.withOpacity(0.12),
                thickness: 1,
              ),
              const SizedBox(height: 8),
              Text(
                text,
                textAlign: isArabic ? TextAlign.right : TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
