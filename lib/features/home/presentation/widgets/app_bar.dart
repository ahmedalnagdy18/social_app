import 'package:firebase_app/features/authentication/presentation/pages/login.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            S.of(context).title,
            //   'Welcome',
            style: const TextStyle(
              fontSize: 22,
              color: Colors.red,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              )),
          const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
