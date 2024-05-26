import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_app/features/authentication/presentation/pages/splash_screen.dart';
import 'package:firebase_app/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb || Platform.isAndroid
        ? const FirebaseOptions(
            apiKey: "AIzaSyCO7noNxHquuEbVbfeknImoZi7Q13Vpe0w",
            appId: "1:49413445749:android:c60ac422a28a8905b4003c",
            messagingSenderId: "49413445749",
            projectId: "authenticationapp-62948",
            storageBucket: "authenticationapp-62948.appspot.com",
          )
        : null,
  );
  // // Ensure widget binding is initialized
  // WidgetsFlutterBinding.ensureInitialized();

  // // Initialize Firebase
  // if (Platform.isAndroid) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: 'AIzaSyCO7noNxHquuEbVbfeknImoZi7Q13Vpe0w',
  //       appId: '1:49413445749:android:c60ac422a28a8905b4003c',
  //       messagingSenderId: '49413445749',
  //       projectId: 'authenticationapp-62948',
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }

  // Setup dependency injection
  setupinjection();

  // Run the app
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      home: SplashScreen(),
    );
  }
}
