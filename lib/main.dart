import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:og_gram/state/auth/backend/authenticator.dart';
import 'firebase_options.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
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
      title: 'RiverPod Project',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('OG-GRAM'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                final result = await Authenticator().loginWithGoogle();
                result.log();
              },
              child: const Text(
                'Google Sign In',
              ),
            ),
            TextButton(
              onPressed: () async {
                final result = await Authenticator().loginWithFacebook();
                result.log();
              },
              child: const Text(
                'Facebook Sign In',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
