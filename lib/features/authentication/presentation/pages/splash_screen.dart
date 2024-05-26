import 'dart:async';

import 'package:firebase_app/features/authentication/presentation/pages/login.dart';
import 'package:firebase_app/features/home/presentation/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void init() async {}

  @override
  void initState() {
    init();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return FirebaseAuth.instance.currentUser == null
                  ? const LoginPage()
                  : const MainPage();
            })));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'images/logoa.jpg',
                scale: 2,
              ),
            ),
            const Text(
              'Developed by Ahmed Alnagdy',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
