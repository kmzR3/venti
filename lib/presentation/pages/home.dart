import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:venti/data/firestore.dart';
import 'package:venti/theme/theme.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? isDarkMode;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        isDarkMode = Theme.of(context).brightness == Brightness.dark;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Venti'),
        toolbarTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/booked');
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/favorite');
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: const GetData(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: GNav(
          gap: 8,
          // backgroundColor: isDarkMode ?? false ? Colors.black : Colors.white,
          // color: isDarkMode ?? false ? Colors.white : Colors.black,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            switch (index) {
              case 0:
                // Navigator.pushNamed(context, '/');
                break;
              case 1:
                Navigator.pushNamed(context, '/booked');
                break;
              case 2:
                Navigator.pushNamed(context, '/favorite');
                break;
              case 3:
                Navigator.pushNamed(context, '/profile');
                break;
            }
          },
          tabs: const [
            GButton(icon: Icons.home_outlined, text: 'Home'),
            GButton(icon: Icons.bookmark_outline, text: 'Booked'),
            GButton(icon: Icons.favorite_outline, text: 'Favorite'),
            GButton(icon: Icons.person_outline, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
