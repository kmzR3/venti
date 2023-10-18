import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  signOut() {}

  signInWithEmailAndPassword(
      {required String email, required String password}) {}

  createUserWithEmailAndPassword({required String email, required String password}) {}
}

// Sign up with email and password
Future<void> signUpWithEmailAndPassword(
  String email, String password) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

// Sign in with email and password
Future<void> createUserWithEmailAndPassword(
    String email, String password) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

// Sign out
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
