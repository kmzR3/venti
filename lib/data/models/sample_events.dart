import 'package:venti/core/entities/event.dart';

import '../../core/entities/ticket.dart';

List<Event> sampleEvents = [
  Event(
    id: '1',
    name: 'Sample Event 1',
    location: 'Sample Location 1',
    date: DateTime(2023, 10, 20, 15, 0),
    venue: 'Sample Venue 1',
    tickets: [
      Ticket(
        id: '1',
        name: 'Sample Ticket 1',
        quantity: 100,
        price: 100,
        description: 'This is a sample ticket description.',
      ),
      Ticket(
        id: '2',
        name: 'Sample Ticket 2',
        quantity: 200,
        price: 200,
        description: 'This is another sample ticket description.',
      ),
    ],
    description: 'This is a sample event description.',
  ),
  Event(
    id: '2',
    name: 'Sample Event 2',
    location: 'Sample Location 2',
    date: DateTime(2023, 11, 5, 19, 30),
    venue: 'Sample Venue 2',
    tickets: [
      Ticket(
        id: '1',
        name: 'Sample Ticket 1',
        quantity: 100,
        price: 100,
        description: 'This is a sample ticket description.',
      ),
      Ticket(
        id: '2',
        name: 'Sample Ticket 2',
        quantity: 200,
        price: 200,
        description: 'This is another sample ticket description.',
      ),
    ],
    description: 'Another sample event description.',
  ),
  // Add more sample events as needed.
];
