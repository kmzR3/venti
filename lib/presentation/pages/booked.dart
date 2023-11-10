import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venti/presentation/pages/event_details.dart';

class BookedEvents extends StatefulWidget {
  const BookedEvents({Key? key}) : super(key: key);

  @override
  State<BookedEvents> createState() => _BookedEventsState();
}

class _BookedEventsState extends State<BookedEvents> {
  Stream<QuerySnapshot> getUserBookedEvents() async* {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;

      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('bookings')
          .get();

      var bookedEventIds = querySnapshot.docs.map((doc) => doc.id).toList();

      if (bookedEventIds.isNotEmpty) {
        yield* FirebaseFirestore.instance
            .collection("events")
            .where("id", whereIn: bookedEventIds)
            .snapshots();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Events'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getUserBookedEvents(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text("No booked events");
          }

          final List<String> bookedEventIds =
              snapshot.data!.docs.map((doc) => doc.id).toList();

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('events')
                .where(FieldPath.documentId, whereIn: bookedEventIds)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> eventSnapshot) {
              if (eventSnapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (eventSnapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              if (!eventSnapshot.hasData || eventSnapshot.data!.docs.isEmpty) {
                return const Text("No booked events");
              }

              return ListView(
                children:
                    eventSnapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['title']),
                    subtitle: Text(data['description']),
                    trailing: Text(data['date'].toString()),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(
                            title: data['title'],
                            id: data['id'],
                            description: data['description'],
                            date: data['date'],
                            venue: data['venue'],
                            location: data['location'],
                            tickets: data['tickets'],
                            img: data['img'],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}
