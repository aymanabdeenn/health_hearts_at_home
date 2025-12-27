import 'package:flutter/material.dart';
import 'package:hhah/widgets/shared/resources_model.dart';
import 'package:hhah/widgets/shared/resource_element.dart';

class ResourcesList extends StatelessWidget {
  final String title;
  final List<ResourceModel> resources; // Accepts data, not widgets

  const ResourcesList({
    super.key,
    required this.title,
    required this.resources,
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
          child: ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 20,
            ), // Add padding at bottom so last item isn't cut off
            itemCount: resources.length,
            itemBuilder: (context, index) {
              final item = resources[index];

              // Here we create your widget using the data
              return ResourcesElement(
                title: item.title,
                type: item.type,
                link: item.link,
              );
            },
          ),
        ),
      ],
    );
  }
}
