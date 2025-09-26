import 'package:flutter/material.dart';

class MyTab extends StatelessWidget { // Custom tab widget to display an icon
  // The class receives the path of the icon image
  final String iconPath;

  const MyTab({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab( // Tab widget to be used in a TabBar
      height: 80,
      child: Container( // Container to style the tab
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
       child: Image.asset( // Load the icon image from 'assets' folder
          iconPath,
          fit: BoxFit.contain, // Use 'contain' to avoid cropping
        ),
      ),
    );
  }
}
