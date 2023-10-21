import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:venti/data/models/sample_events.dart';
// import 'package:venti/presentation/widgets/events_widget.dart';
import 'package:venti/services/auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget _title() {
    return const Text("Venti");
  }

  Widget _userUid() {
    return Text(user?.email ?? "user email",
        style: const TextStyle(fontSize: 20));
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text("Sign Out"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // const EventListWidget(),
              _userUid(),
              const SizedBox(height: 20),
              _signOutButton(),
            ],
          ),
        ));
  }
}