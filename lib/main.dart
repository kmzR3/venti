import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:venti/presentation/pages/profile_page.dart';
import 'package:venti/presentation/widgets/widget_tree.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: const WidgetTree(),
        // initialRoute: '/',
        routes: {
          // '/': (context) => const MyHomePage(),
          '/profile': (context) => ProfilePage(),
          // '/login': (context) => const MyLogin(),
          // '/register': (context) => const MyRegister(),
          // '/forgot': (context) => const MyForgot(),
        });
  }
}
