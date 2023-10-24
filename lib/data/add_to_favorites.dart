// import 'package:cloud_firestore/cloud_firestore.dart';

// final userId = "user_id"; // Replace with the user's actual ID
// final eventId = "event_id"; // Replace with the event's actual ID

// // Reference to the user's favorites
// final userFavoritesRef =
//     FirebaseFirestore.instance.collection('users').doc(userId).collection('favorites');

// // Check if the event is already in favorites
// userFavoritesRef.doc(eventId).get().then((DocumentSnapshot snapshot) {
//   if (snapshot.exists) {
//     // Event is already a favorite, do nothing
//   } else {
//     // Event is not a favorite, add it to favorites
//     userFavoritesRef.doc(eventId).set({'favorite': true});
//   }
// });
