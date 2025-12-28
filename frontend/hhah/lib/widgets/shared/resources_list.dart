import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/widgets/shared/resource_element.dart';

class ResourcesList extends StatelessWidget {
  final List<ResourceModel> resources;
  final String title; // Accepts data, not widgets

  const ResourcesList({
    super.key,
    required this.resources,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            title,
            style: GoogleFonts.oswald(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.tertiaryBGColor,
            ),
          ),
        ),
        SizedBox(height: 10),
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
