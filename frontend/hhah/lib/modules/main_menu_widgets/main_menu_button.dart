import 'package:flutter/material.dart';

class MainMenuButton extends StatelessWidget {
  const MainMenuButton({super.key, required this.label, required this.icon});
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(325, 50),
        backgroundColor: Color.fromARGB(255, 223, 47, 173),
        foregroundColor: Colors.white,
        iconSize: 24,
        alignment: Alignment.centerLeft,
        textStyle: TextStyle(fontSize: 16),
      ),
      onPressed: () {},
      icon: Padding(padding: EdgeInsets.only(right: 10), child: icon),
      label: Text(label),
    );
  }
}
