import 'package:flutter/material.dart';
// import 'package:venti/core/entities/ticket.dart';
import 'package:venti/data/models/sample_events.dart';
import 'package:venti/presentation/pages/event_details_page.dart'; // Import the sample events

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Events'),
      ),
      body: ListView.builder(
        itemCount: sampleEvents.length,
        itemBuilder: (context, index) {
          final event = sampleEvents[index];
          return ListTile(
            // Display the event name and date
            title: Text(event.name as String),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.date.toString()),
                Text('Ticket Quantity: ${event.tickets?[0].quantity}'),
                Text('Ticket Price: ${event.tickets?[0].price}'),
                // Add other ticket details here as needed
              ],
            ),

            onTap: () {
              // Add your navigation logic here
              // For example, you can use Navigator.push() to navigate to a new page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsPage(event: event),
                ),
              );
            },
            // You can display other event details here as needed
          );
        },
      ),
    );
  }
}
