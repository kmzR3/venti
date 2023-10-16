// display event details
// Compare this snippet from lib/presentation/pages/event_details_page.dart:
import 'package:flutter/material.dart';
import 'package:venti/data/models/sample_events.dart';
import '../../core/entities/event.dart'; // Import the sample events

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name)), 
      body: Column(
        children: [
          Text(event.name),
          Text(event.location),
          Text(event.venue),
          Text(event.description),
        ],
      ),
    );
  }
}
