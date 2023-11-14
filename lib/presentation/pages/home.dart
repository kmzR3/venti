import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:venti/data/firestore.dart';
import 'package:venti/presentation/widgets/page_wrapper.dart';

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
    return PageWrapper(
      selectedIndex: 0,
      onTabChange: (index) {
        // Handle tab change if needed
      },
      child: Scaffold(
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
          automaticallyImplyLeading: false,
        ),
        body: const GetData(),
      ),
    );
  }
}
