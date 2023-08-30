import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Venti App',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        toolbarTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
            activeIcon: Icon(Icons.home), // <-- new,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.deepPurple,
            //
            // Navigator.pop(context);
          ),
        ],
      ),
      body: const MainContent(),
      // body: const Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       // LoginForm(),
      //       Text(
      //         'Venti App',
      //         style: TextStyle(fontSize: 40),
      //       ),
      //       Text(
      //         'by: Oniichann',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(2),
      children: const <Widget>[
        Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Card 1',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Card 2',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Card 3',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Card 4',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Card 5',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'Card 6',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        LoginForm()
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Enter your Password',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

// create a
