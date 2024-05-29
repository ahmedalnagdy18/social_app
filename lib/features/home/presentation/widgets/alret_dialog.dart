import 'package:firebase_app/core/common/buttons.dart';
import 'package:firebase_app/features/authentication/presentation/pages/login.dart';
import 'package:firebase_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/applogo.png',
            scale: 3,
          ),
          Text(
            S.of(context).logoutmssg,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: ButtonWidget(
                    text: S.of(context).yes,
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
                    colors: const [Colors.black, Colors.red],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SizedBox(
                  height: 35,
                  child: ButtonWidget(
                    text: S.of(context).no,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    colors: const [Colors.black, Colors.grey],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
