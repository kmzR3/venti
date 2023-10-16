// display event details
// Compare this snippet from lib/presentation/pages/event_details_page.dart:
import 'package:flutter/material.dart';
// import 'package:venti/data/models/sample_events.dart';
import '../../core/entities/event.dart'; // Import the sample events

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.name as String)),
      body: Column(
        children: [
          Text(event.name as String),
          Text(event.location as String),
          Text(event.venue as String),
          Text(event.description as String),
        ],
      ),
    );
  }
}
