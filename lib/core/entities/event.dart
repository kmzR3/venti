import 'package:venti/core/entities/ticket.dart';

class Event {
  final String? id;
  final String? name;
  final DateTime? date;
  final String? location;
  final String? venue;
  final List<Ticket>? tickets;
  final String? description;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.venue,
    required this.tickets,
    required this.description,
  });
}
