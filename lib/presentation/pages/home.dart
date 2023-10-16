import 'package:flutter/material.dart';
import 'package:venti/presentation/widgets/events_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        // centerTitle: true,
        title: const Text(
          'Venti App',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
            activeIcon: Icon(Icons.home), // <-- new,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.deepPurple,
            //
            // Navigator.pop(context);
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            // Navigator.pushNamed(context, '/create');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
      body: const EventListWidget(),
    );
  }
}
