import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/widgets/shared/resources_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hhah/colors/app_colors.dart';

class ResourcesElement extends StatelessWidget {
  const ResourcesElement({
    super.key,
    required this.type,
    required this.link,
    required this.title,
  });

  final String title;
  final String type;
  final String link;

  Future<void> _launchUrl(BuildContext context) async {
    final uri = Uri.tryParse(link);
    if (uri == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid URL')));
      return;
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch $uri')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _launchUrl(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        child: Row(
          children: [
            Icon(
              type == 'VIDEO'
                  ? Icons.video_library
                  : (type == 'GROUP')
                  ? Icons.group
                  : Icons.article,
              size: 40,
              color: AppColors.tertiaryBGColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.oswald(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.tertiaryBGColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Open resource',
                    style: GoogleFonts.oswald(color: AppColors.tertiaryBGColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
