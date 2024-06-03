import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_app/features/authentication/presentation/pages/splash_screen.dart';
import 'package:firebase_app/features/home/presentation/cubit/lang_cubit/locale_cubit.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:firebase_app/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return BlocProvider(
      create: (context) => LocaleCubit()..getSavedLanguage(),
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            builder: DevicePreview.appBuilder,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
