import 'package:venti/core/repositories/ticket_repository.dart';

class PurchaseTicketsUseCase {
  final TicketRepository repository;

  PurchaseTicketsUseCase(this.repository);

  Future<void> execute({
    required String eventId,
    required int numberOfTickets,
  }) async {
    try {
      // Use the repository to purchase the specified number of tickets for the event.
      await repository.purchaseTickets(eventId: eventId, numberOfTickets: numberOfTickets);

      // Optionally, you can perform post-purchase actions or validation here.

    } catch (e) {
      // Handle errors, log them, and re-throw if needed.
      // You can create custom exception classes for better error handling.
      throw TicketPurchaseException('Failed to purchase tickets: $e');
    }
  }
}

class TicketPurchaseException implements Exception {
  final String message;

  TicketPurchaseException(this.message);
}
