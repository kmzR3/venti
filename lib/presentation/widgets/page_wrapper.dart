import 'package:flutter/material.dart';
import 'package:venti/presentation/widgets/bottom_nav_bar.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final int selectedIndex;
  final Function(int) onTabChange;

  const PageWrapper({
    super.key,
    required this.child,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          if (index != selectedIndex) {
            onTabChange(index);
          }
        },
      ),
    );
  }
}
