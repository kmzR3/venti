import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venti/presentation/widgets/page_wrapper.dart';
import 'package:venti/services/auth.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final User? user = Auth().currentUser;

  // Variables to store event input
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController dateController;
  late TextEditingController descriptionController;
  late TextEditingController imgController;
  late TextEditingController locationController;
  late TextEditingController venueController;
  late TextEditingController titleController;

  // Variable to track the sign-out state
  // bool isSignedOut = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    idController = TextEditingController();
    dateController = TextEditingController();
    descriptionController = TextEditingController();
    imgController = TextEditingController();
    locationController = TextEditingController();
    venueController = TextEditingController();
    titleController = TextEditingController();
  }

  // ... (rest of the code remains unchanged)

  Future<void> updateEvent(BuildContext context) async {
    try {
      // Update the Firestore document for the event
      final eventDoc = FirebaseFirestore.instance.collection('events').doc();
      await eventDoc.set({
        'id': idController.text,
        'date': dateController.text,
        'description': descriptionController.text,
        'img': imgController.text,
        'location': locationController.text,
        'venue': venueController.text,
        'title': titleController.text,
      });

      // Show a SnackBar with a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Event created successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error creating event: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedIndex: 3, // Set the appropriate index for each page
      onTabChange: (index) {
        // Handle tab change if needed
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Venti"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Event ID input
              TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'Event ID'),
              ),
              const SizedBox(height: 10),

              // Event name input
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Event Title'),
              ),
              const SizedBox(height: 10),

              // Event date input
              TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Event Date'),
              ),
              const SizedBox(height: 10),

              // Event description input
              TextField(
                controller: descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Event Description'),
              ),
              const SizedBox(height: 10),

              // Event image input
              TextField(
                controller: imgController,
                decoration: const InputDecoration(labelText: 'Event Image URL'),
              ),
              const SizedBox(height: 10),

              // Event location input
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Event Location'),
              ),
              const SizedBox(height: 10),

              // Event venue input
              TextField(
                controller: venueController,
                decoration: const InputDecoration(labelText: 'Event Venue'),
              ),
              const SizedBox(height: 20),

              // Event title input

              const SizedBox(height: 20),

              // Update Event Button
              ElevatedButton(
                onPressed: () => updateEvent(context),
                child: const Text("Create Event"),
              ),
              // const SizedBox(height: 20),

              // Display signed out message
            ],
          ),
        ),
      ),
    );
  }
}
