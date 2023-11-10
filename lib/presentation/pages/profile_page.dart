import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venti/services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? user = Auth().currentUser;

  // Variables to store user input
  late TextEditingController nameController;
  late TextEditingController phoneController;

  // Variable to track the sign-out state
  bool isSignedOut = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with current user data
    nameController = TextEditingController(text: user?.displayName ?? "");
    phoneController = TextEditingController(text: user?.phoneNumber ?? "");
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // Set the state to indicate successful sign-out
      setState(() {
        isSignedOut = true;
      });

      // Show a SnackBar with a message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You have been signed out. Please go back to sign in.'),
          backgroundColor: Color.fromARGB(255, 238, 0, 0),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    try {
      // Update the user's profile locally
      await user?.updateProfile(displayName: nameController.text);

      // Update the Firestore document
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(user?.uid);
      await userDoc.update({
        'name': nameController.text,
        'phone': phoneController.text,
      });

      // Show a SnackBar with a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error updating profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venti"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // User email
            Text(user?.email ?? "user email",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),

            // User name input
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 10),

            // User phone number input
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 20),

            // Update Profile Button
            ElevatedButton(
              onPressed: () => updateProfile(context),
              child: const Text("Update Profile"),
            ),
            const SizedBox(height: 20),

            // Sign Out Button
            ElevatedButton(
              onPressed: () => signOut(context),
              child: const Text("Sign Out"),
            ),

            // Display signed out message
            if (isSignedOut)
              const Text(
                'You have been signed out.',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
