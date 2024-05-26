import 'package:firebase_app/features/home/presentation/widgets/setting_widget.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SettingWidget(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'Change Language',
              ),
              SizedBox(height: 20),
              SettingWidget(
                icon: Icons.color_lens_outlined,
                title: 'Theme',
                subtitle: 'Change color',
              ),
              SizedBox(height: 20),
              SettingWidget(
                icon: Icons.logout,
                title: 'Logout',
                subtitle: 'Logout from the app ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
