// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  List<Event> events;

  EventsModel({
    required this.events,
  });

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class Event {
  DateTime date;
  String description;
  String id;
  String location;
  String name;
  List<Ticket> tickets;
  String venue;

  Event({
    required this.date,
    required this.description,
    required this.id,
    required this.location,
    required this.name,
    required this.tickets,
    required this.venue,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        date: DateTime.parse(json["date"]),
        description: json["description"],
        id: json["id"],
        location: json["location"],
        name: json["name"],
        tickets:
            List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
        venue: json["venue"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "description": description,
        "id": id,
        "location": location,
        "name": name,
        "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
        "venue": venue,
      };
}

class Ticket {
  int price;
  int quantity;
  String type;

  Ticket({
    required this.price,
    required this.quantity,
    required this.type,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        price: json["price"],
        quantity: json["quantity"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "quantity": quantity,
        "type": type,
      };
}
