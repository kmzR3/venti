// import 'package:flutter/material.dart';

// class BottomNav extends StatefulWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   BottomNav({required this.selectedIndex, required this.onItemTapped});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BottomNavState createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: widget.selectedIndex,
//       onTap: widget.onItemTapped,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: 'Search',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }
