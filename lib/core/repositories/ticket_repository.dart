import 'package:venti/core/entities/ticket.dart';

abstract class TicketRepository {
  /// Fetch a list of tickets based on a query.
  Future<List<Ticket>> searchTickets({required String query});

  // purchaseTicket
  Future<void> purchaseTickets(
      {required String eventId, required int numberOfTickets});

  /// Retrieve detailed information about a specific ticket.
  Future<Ticket> getTicketDetails({required String ticketId});

  /// Add a ticket to the user's list of favorites.
  Future<void> addToFavorites({required String ticketId});

  /// Remove a ticket from the user's list of favorites.
  Future<void> removeFromFavorites({required String ticketId});
}
