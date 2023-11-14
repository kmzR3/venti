import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      child: GNav(
        gap: 8,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey,
        padding: const EdgeInsets.all(16),
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          // Only navigate if the index is different from the current index
          if (selectedIndex != index) {
            onTabChange(index);
          }
        },
        tabs: const [
          GButton(icon: Icons.home_outlined, text: 'Home'),
          GButton(icon: Icons.bookmark_outline, text: 'Booked'),
          GButton(icon: Icons.favorite_outline, text: 'Favorite'),
          GButton(icon: Icons.person_outline, text: 'Profile'),
        ],
      ),
    );
  }
}
