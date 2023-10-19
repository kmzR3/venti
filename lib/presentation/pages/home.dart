// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:venti/presentation/widgets/events_widget.dart';
// import 'package:venti/services/auth.dart';

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   final User? user = Auth().currentUser;

//   Future<void> signOut() async {
//     await FirebaseAuth.instance.signOut();
//   }

//   Widget _title() {
//     return const Text("Firebase Auth");
//   }

//   Widget _userUid() {
//     return Text(user?.email ?? "user email");
//   }

//   Widget _signOutButton() {
//     return ElevatedButton(
//       onPressed: signOut,
//       child: const Text("Sign Out"),
//     );
//   }

//   // @override
//   // State<MyHomePage> createState() => _MyHomePageState();
// }

// // class _MyHomePageState extends State<MyHomePage> {
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       leading: const Icon(Icons.menu),
//       // centerTitle: true,
//       title: const Text(
//         'Venti App',
//       ),
//       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       toolbarTextStyle: const TextStyle(
//         color: Colors.white,
//         fontSize: 30,
//         fontWeight: FontWeight.bold,
//       ),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: () {
//             // Add your search functionality here
//           },
//         ),
//       ],
//     ),
//     // bottomNavigationBar: BottomNavigationBar(
//     //   items: const <BottomNavigationBarItem>[
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.home),
//     //       label: 'Home',
//     //       backgroundColor: Colors.deepPurple,
//     //       activeIcon: Icon(Icons.home), // <-- new,
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.add),
//     //       label: 'Create',
//     //       backgroundColor: Colors.deepPurple,
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.person),
//     //       label: 'Profile',
//     //       backgroundColor: Colors.deepPurple,
//     //       //
//     //       // Navigator.pop(context);
//     //     ),
//     //   ],
//     //   onTap: (index) {
//     //     if (index == 0) {
//     //       Navigator.pushNamed(context, '/');
//     //     } else if (index == 1) {
//     //       // Navigator.pushNamed(context, '/create');
//     //     } else if (index == 2) {
//     //       Navigator.pushNamed(context, '/login');
//     //     }
//     //   },
//     // ),
//     // body: const EventListWidget(),
//     body: Container(
//       height: double.infinity,
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _userUid(),
//           _signOutButton(),
//         ],
//       ),
//     ),
//   );
// }
