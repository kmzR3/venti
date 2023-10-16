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
    );
  }
}
