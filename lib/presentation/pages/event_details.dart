import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final String venue;
  final String location;
  final Map tickets;
  final String id;
  final String? img;

  const EventDetailPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.venue,
      required this.location,
      required this.tickets,
      required this.img,
      required this.id})
      : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    // Check if the event is already in favorites when the page loads
    checkFavoriteStatus();
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

  Future<void> favoriteEvent() async {
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
      } else {
        // Event is not a favorite, add it to favorites
        userFavoritesRef.doc(eventId).set({'favorite': true});
      }

      setState(() {
        isFavorite = !isFavorite; // Toggle the favorite state
      });
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
              favoriteEvent();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 200,
              // width: 200,

              child: Image.network('${widget.img}'),
            ),
            Text('Description: ${widget.description}'),
            Text('Location: ${widget.location}'),
            Text('Venue: ${widget.venue}'),
            Text('Date: ${widget.date}'),
            Text('Tickets: ${widget.tickets ?? 'No tickets available'}'),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle the buy button press here
                },
                child: const Text('Buy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
