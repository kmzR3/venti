import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // LoginForm(),
            Text(
              'Venti App',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              'by: Oniichann',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
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
            Navigator.pushNamed(context, '/login');
          }
        },
      ),
    );
  }
}
