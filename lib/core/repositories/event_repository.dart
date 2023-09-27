import 'package:venti/core/entities/event.dart';

abstract class EventRepository {
  /// Fetch a list of events based on a query.
  Future<List<Event>> searchEvents({required String query});

  /// Retrieve detailed information about a specific event.
  Future<Event> getEventDetails({required String eventId});

  /// Add an event to the user's list of favorites.
  Future<void> addToFavorites({required String eventId});

  /// Remove an event from the user's list of favorites.
  Future<void> removeFromFavorites({required String eventId});

}