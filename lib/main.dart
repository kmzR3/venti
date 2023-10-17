import 'package:flutter/material.dart';
import 'package:venti/presentation/pages/home.dart';
import 'package:venti/presentation/pages/login.dart';
import 'package:venti/presentation/pages/profile.dart';
import 'package:venti/presentation/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Venti',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/profile': (context) => const MyProfile(),
          '/login': (context) => const MyLogin(),
          '/register': (context) => const MyRegister(),
        });
  }
}
