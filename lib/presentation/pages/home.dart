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
          'Venti App',
        ),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       backgroundColor: Colors.deepPurple,
      //       activeIcon: Icon(Icons.home), // <-- new,
      //       // disable icon
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add),
      //       label: 'Create',
      //       backgroundColor: Colors.deepPurple,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //       backgroundColor: Colors.deepPurple,
      //       //
      //       // Navigator.pop(context);
      //     ),
      //   ],
      //   onTap: (index) {
      //     if (index == 0) {
      //       // Navigator.pushNamed(context, '/');
      //     } else if (index == 1) {
      //       // Navigator.pushNamed(context, '/create');
      //     } else if (index == 2) {
      //       Navigator.pushNamed(context, '/profile');
      //     }
      //   },
      // ),
      // read from database

      body: const GetData(),
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   padding: const EdgeInsets.all(20),
      //   child: const Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       EventListWidget(),
      //     ],
      //   ),
      // ),
    );
  }
}
