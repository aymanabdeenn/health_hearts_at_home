import 'package:flutter/material.dart';
import 'package:hhah/colors/app_colors.dart';
import 'package:hhah/models/resource-model.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/widgets/shared/resources_list.dart';

class LinksToWebsites extends StatelessWidget {
  const LinksToWebsites({
    super.key,
    required this.switchScreen,
    required this.isEnglish,
    required this.resources,
  });

  final void Function(ScreenType screen) switchScreen;
  final bool isEnglish;
  final List<ResourceModel> resources;
  final String title = 'Links to Reliable Websites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text(isEnglish ? 'Links' : 'روابط'),
        backgroundColor: AppColors.primaryBGColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => switchScreen(ScreenType.aboutChdAndTreatment),
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
          child: ResourcesList(
            resources: resources,
            title: isEnglish
                ? 'Links to Reliable Websites'
                : 'روابط لمواقع موثوقة',
          ),
        ),
      ),
    );
  }
}
