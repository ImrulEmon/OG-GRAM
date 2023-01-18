import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:og_gram/state/auth/models/auth_result.dart';
import 'package:og_gram/state/auth/providers/auth_state_provider.dart';
import 'package:og_gram/state/providers/is_loading_provider.dart';
import 'package:og_gram/views/components/loading/loading_screen.dart';
import 'package:og_gram/views/login/login_view.dart';
import 'package:og_gram/views/main/main_view.dart';
// import 'package:og_gram/state/auth/providers/is_logged_in_provider.dart';
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
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen<bool>(isLoadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingScreen.instance().show(
                context: context,
              );
            } else {
              LoadingScreen.instance().hide();
            }
          });

          final isLoggedIn =
              ref.watch(authStateProvider).result == AuthResult.success;
          if (isLoggedIn) {
            return MainView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}

// When you are already logged in
// class MainView extends StatelessWidget {
//   const MainView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Main View'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, ref, child) {
//             return TextButton(
//               onPressed: () async {
//                 await ref.read(authStateProvider.notifier).logOut();
//               },
//               child: const Text('Logout'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
