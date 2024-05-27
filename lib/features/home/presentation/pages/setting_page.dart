import 'package:firebase_app/features/home/presentation/pages/lang_setting_page.dart';
import 'package:firebase_app/features/home/presentation/widgets/setting_widget.dart';
import 'package:firebase_app/generated/l10n.dart';
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
        title: Text(
          S.of(context).setting,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SettingWidget(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LangSettingsPage()));
                },
                icon: Icons.language_outlined,
                title: S.of(context).language,
                subtitle: S.of(context).changeLang,
              ),
              const SizedBox(height: 20),
              SettingWidget(
                icon: Icons.color_lens_outlined,
                title: S.of(context).theme,
                subtitle: S.of(context).changeColor,
              ),
              const SizedBox(height: 20),
              SettingWidget(
                icon: Icons.logout,
                title: S.of(context).logout,
                subtitle: S.of(context).logoutFromApp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
