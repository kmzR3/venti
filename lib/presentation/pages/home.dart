import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:venti/data/firestore.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        // centerTitle: true,
        title: const Text(
          'Venti',
        ),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: const GetData(),
    );
  }
}
