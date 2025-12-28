import 'package:flutter/material.dart';
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
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: numbers
              .map(
                (n) => Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: InkWell(
                    onTap: () => _dialNumber(context, n),
                    child: Text(
                      n,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        isThreeLine: numbers.length > 1,
        onTap: onTap,
      ),
    );
  }
}
