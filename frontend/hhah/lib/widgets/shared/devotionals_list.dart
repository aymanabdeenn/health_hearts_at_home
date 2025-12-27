import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/resource_element.dart';

class DevotionalsList extends StatelessWidget {
  final String title;
  final String videolink;
  final String text;

  const DevotionalsList({
    super.key,
    required this.title,
    required this.videolink,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        // Expanded ensures the list takes up the remaining space
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(
              bottom: 20,
            ), // Add padding at bottom so last item isn't cut off
            children: [
              ResourcesElement(title: title, type: "Video", link: videolink),
              ResourcesElement(
                title: "Read the Devotional",
                type: "Article",
                link: text,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
