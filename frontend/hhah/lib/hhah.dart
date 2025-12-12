import 'package:flutter/material.dart';
import 'package:hhah/screens/main_menu.dart';

class Hhah extends StatefulWidget {
  Hhah({super.key});

  final Map<String, Color> backgroundColors = {
    "primaryColor": Color.fromARGB(255, 253, 216, 245),
    "secondaryColor": Color.fromARGB(255, 255, 152, 226),
    "tertiaryColor": Color.fromARGB(255, 223, 47, 173),
  };

  @override
  State<Hhah> createState() => _hhahState();
}

class _hhahState extends State<Hhah> {
  Widget? activeScreen;
  bool isEnglish = true;

  void switchScreen(Widget screen) {
    setState(() {
      activeScreen = screen;
    });
  }

  void switchLang() {
    setState(() {
      isEnglish = !isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.backgroundColors['secondaryColor'],
          actions: [
            IconButton(
              onPressed: switchLang,
              icon: Icon(
                Icons.language,
                color: widget.backgroundColors['primaryColor'],
                size: 30,
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.backgroundColors['primaryColor']!,
                widget.backgroundColors['secondaryColor']!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              activeScreen ??
              MainMenu(
                switchScreen: switchScreen,
                backgroundColors: widget.backgroundColors,
                isEnglish: isEnglish,
              ),
        ),
      ),
    );
  }
}
