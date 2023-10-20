import 'package:flutter/material.dart';
import 'package:venti/presentation/pages/home.dart';
import 'package:venti/presentation/pages/login_register_page.dart';
import 'package:venti/services/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyHomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
