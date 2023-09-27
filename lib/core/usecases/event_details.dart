import 'package:venti/core/entities/event.dart';
import 'package:venti/core/repositories/event_repository.dart';

class RetrieveEventDetailsUseCase {
  final EventRepository repository;

  RetrieveEventDetailsUseCase(this.repository);

  Future<Event> execute({required String eventId}) async {
    try {
      // Use the repository to fetch detailed information about the event.
      final event = await repository.getEventDetails(eventId: eventId);

      // Optionally, you can apply additional business logic or processing here.

      return event;
    } catch (e) {
      // Handle errors, log them, and re-throw if needed.
      // You can create custom exception classes for better error handling.
      throw EventDetailsException('Failed to retrieve event details: $e');
    }
  }
}

class EventDetailsException implements Exception {
  final String message;

  EventDetailsException(this.message);
}
