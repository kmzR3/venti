import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final String venue;
  final String location;
  final Map<String, dynamic> tickets;
  final String id;
  final String? img;

  const EventDetailPage({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.venue,
    required this.location,
    required this.tickets,
    required this.img,
    required this.id,
  }) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isFavorite = false;
  bool isBooked = false;

  @override
  void initState() {
    super.initState();
    // Check if the event is already in favorites or booked when the page loads
    checkFavoriteStatus();
    checkBookedStatus();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  Future<void> checkFavoriteStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      String eventId = widget.id;
      final userFavoritesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favorites');
      DocumentSnapshot snapshot = await userFavoritesRef.doc(eventId).get();
      setState(() {
        isFavorite = snapshot.exists;
      });
    }
  }

  Future<void> checkBookedStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      String eventId = widget.id;
      final userBookingsRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('bookings');
      DocumentSnapshot snapshot = await userBookingsRef.doc(eventId).get();
      setState(() {
        isBooked = snapshot.exists;
      });
    }
  }

  Future<void> toggleFavorite() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      String eventId = widget.id;
      final userFavoritesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favorites');
      DocumentSnapshot snapshot = await userFavoritesRef.doc(eventId).get();

      if (snapshot.exists) {
        // Event is already a favorite, remove it from favorites
        userFavoritesRef.doc(eventId).delete();
        _showSnackBar('Event removed from favorites');
      } else {
        // Event is not a favorite, add it to favorites
        userFavoritesRef.doc(eventId).set({'favorite': true});
        _showSnackBar('Event added to favorites');
      }

      setState(() {
        isFavorite = !isFavorite; // Toggle the favorite state
      });
    }
  }

  Future<void> toggleBook() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      String eventId = widget.id;
      final userBookingsRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('bookings');
      DocumentSnapshot snapshot = await userBookingsRef.doc(eventId).get();

      if (snapshot.exists) {
        // Event is already booked, show a message or take appropriate action
        _showSnackBar('You have already booked this event');
      } else {
        // Event is not booked, add it to bookings
        userBookingsRef.doc(eventId).set({'booked': true});
        _showSnackBar('Event booked successfully');
        setState(() {
          isBooked = true; // Update the booked state
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              toggleFavorite();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('${widget.img}'),
            const SizedBox(
              height: 5,
            ),
            Text('Description: ${widget.description}'),
            Text('Location: ${widget.location}'),
            Text('Venue: ${widget.venue}'),
            Text('Date: ${widget.date}'),
            Text(
                'Tickets: ${widget.tickets.isEmpty ? 'No tickets available' : widget.tickets.values.map((value) => value.toString().replaceAll(RegExp(r'{|}'), '')).join(', ')}'),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  // Perform the booking action here
                  // MaterialPageRoute(builder: (context) => const MpesaPayment());
                  toggleBook();
                },
                child: const Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
