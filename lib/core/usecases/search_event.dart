import 'package:venti/core/entities/event.dart';
import 'package:venti/core/repositories/event_repository.dart';

class SearchForEventsUseCase {
  final EventRepository repository;

  SearchForEventsUseCase(this.repository);

  Future<List<Event>> execute({required String query}) async {
    try {
      // Perform any necessary validation on the query, if needed.

      // Use the repository to fetch events based on the query.
      final events = await repository.searchEvents(query: query);

      // Optionally, you can apply additional business logic or filtering here.

      return events;
    } catch (e) {
      // Handle errors, log them, and re-throw if needed.
      // You can create custom exception classes for better error handling.
      throw EventSearchException('Failed to search for events: $e');
    }
  }
}

class EventSearchException implements Exception {
  final String message;

  EventSearchException(this.message);
}
