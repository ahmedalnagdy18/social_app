import 'package:firebase_app/features/home/presentation/pages/create_post_page.dart';
import 'package:firebase_app/features/home/presentation/pages/setting_page.dart';
import 'package:firebase_app/features/home/presentation/pages/timeline.dart';
import 'package:firebase_app/features/home/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

//! navigation bar page
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List name = [];
  int selectedindex = 0;

  @override
  void initState() {
    name.addAll([
      const TimelinePage(),
      const CreatpostPage(),
      const SettingPage(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: name.elementAt(selectedindex),
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: selectedindex,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}
