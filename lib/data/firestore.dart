import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venti/presentation/pages/event_details.dart';
// import 'package:venti/core/entities/event.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final Stream<QuerySnapshot> _eventsStream =
      FirebaseFirestore.instance.collection('events').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: _eventsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        if (snapshot.data == null) {
          return const Text("No data");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              // leading: const Icon(Icons.event),
              title: Text(data['title']),
              subtitle: Text(data['description']),
              trailing: Text(data['date'].toString()),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventDetailPage(
                      title: data['title'],
                      description: data['description'],
                      date: data['date'],
                      venue: data['venue'],
                      location: data[
                          'location'], // Convert Firestore timestamp to DateTime
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    ));
  }
}
