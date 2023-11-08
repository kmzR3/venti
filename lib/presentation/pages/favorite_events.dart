import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venti/presentation/pages/event_details.dart';

class FavoriteEvents extends StatefulWidget {
  const FavoriteEvents({super.key});

  @override
  State<FavoriteEvents> createState() => _FavoriteEventsState();
}

class _FavoriteEventsState extends State<FavoriteEvents> {
  Stream<QuerySnapshot> getUserFavoriteEvents() {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;

      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .snapshots();
    }
    return const Stream.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Events'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getUserFavoriteEvents(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Text("No favorite events");
          }

          final List<String> favoriteEventIds =
              snapshot.data!.docs.map((doc) => doc.id).toList();

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('events')
                .where(FieldPath.documentId, whereIn: favoriteEventIds)
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
                return const Text("No favorite events");
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
