import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalContactElement extends StatelessWidget {
  const PersonalContactElement({
    super.key,
    this.icon = Icons.contact_phone,
    required this.label,
    required this.numbers,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final List<String> numbers;
  final VoidCallback onTap;

  Future<void> _dialNumber(BuildContext context, String number) async {
    final uri = Uri.parse('tel:$number');
    try {
      final launched = await launchUrl(uri);
      if (!launched) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open dialer')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to launch dialer')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.tertiaryBGColor.withOpacity(0.12),
                  child: Icon(icon, color: AppColors.tertiaryBGColor, size: 22),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: numbers
                          .map(
                            (n) => GestureDetector(
                              onTap: () => _dialNumber(context, n),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: Colors.blueAccent,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      n,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.call, color: AppColors.tertiaryBGColor),
                onPressed: numbers.isNotEmpty
                    ? () => _dialNumber(context, numbers[0])
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
