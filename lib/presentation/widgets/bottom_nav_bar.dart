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
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: GNav(
        gap: 8,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.purple.shade300,
        padding: const EdgeInsets.all(16),
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          if (selectedIndex != index) {
            // Check if the page is already in the stack
            bool pageExists = false;
            Navigator.of(context).popUntil((route) {
              pageExists = route.settings.name == getPageName(index);
              return true;
            });

            // If the page exists, don't push a new instance
            if (!pageExists) {
              Navigator.pushNamed(context, getPageName(index));
            }

            onTabChange(index);
          }
        },
        tabs: [
          GButton(
            icon: selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: selectedIndex == 1 ? Icons.bookmark : Icons.bookmark_outline,
            text: 'Booked',
          ),
          GButton(
            icon: selectedIndex == 2 ? Icons.favorite : Icons.favorite_outline,
            text: 'Favorite',
          ),
          GButton(
            icon: selectedIndex == 3 ? Icons.person : Icons.person_outline,
            text: 'Profile',
          ),
        ],
      ),
    );
  }

  // Helper function to get the route name based on the index
  String getPageName(int index) {
    switch (index) {
      case 0:
        return '/';
      case 1:
        return '/booked';
      case 2:
        return '/favorite';
      case 3:
        return '/profile';
      default:
        return '/';
    }
  }
}
