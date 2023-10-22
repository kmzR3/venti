import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venti/services/auth.dart';

class EventDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final String venue;
  final String location;
  final Map tickets;

  const EventDetailPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.date,
      required this.venue,
      required this.location,
      required this.tickets})
      : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isFavorite = false;
  final User? user = Auth().currentUser;
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
              setState(() {
                isFavorite = !isFavorite; // Toggle the favorite state
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
