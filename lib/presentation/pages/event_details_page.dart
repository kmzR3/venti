import 'package:flutter/material.dart';
import 'package:venti/presentation/widgets/bottom_nav.dart';
import '../../core/entities/event.dart'; // Import the sample events
import 'package:intl/intl.dart';

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
          Text(DateFormat('yyyy-MM-dd').format(event.date as DateTime)),
          Text('Ticket Quantity: ${event.tickets?[0].quantity}'),
          Text('Ticket Price: ${event.tickets?[0].price}'),
          // Add other ticket details here as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
            activeIcon: Icon(Icons.home), // <-- new,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.deepPurple,
            //
            // Navigator.pop(context);
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            // Navigator.pushNamed(context, '/create');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
      // bottomNavigationBar: const BottomNavigation(),
    );
  }
}
