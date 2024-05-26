import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final dynamic Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return CustomLineIndicatorBottomNavbar(
      unselectedIconSize: 20,
      selectedIconSize: 20,
      selectedColor: Colors.red,
      unSelectedColor: Colors.black54,
      backgroundColor: Colors.white,
      enableLineIndicator: true,
      lineIndicatorWidth: 5,
      indicatorType: IndicatorType.top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'Home',
          icon: Icons.home_max_outlined,
        ),
        CustomBottomBarItems(icon: Icons.add, label: ''),
        CustomBottomBarItems(
          label: 'Setting',
          icon: Icons.settings,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
