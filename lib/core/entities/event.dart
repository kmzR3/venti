import 'package:venti/core/entities/ticket.dart';

class Event {
  final String? id;
  final String? name;
  final DateTime? date;
  final String? venue;
  final List<Ticket>? tickets;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.venue,
    required this.tickets,
  });
}


