import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/home/home_screen.dart';
import '../view/screens/settings/settings_screen.dart';

class DashBoardController extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Widget> screen = const [
    HomeScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: "الشاشة الرئيسية",
      tooltip: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "الاعدادات",
      tooltip: "",
    ),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
