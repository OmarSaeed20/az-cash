import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controller/dashboard_controller.dart';

class DashboradScreen extends StatelessWidget {
  DashboradScreen({Key? key}) : super(key: key);

  final DashBoardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.screen[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => controller.changeIndex(index),
          currentIndex: controller.currentIndex.value,
          backgroundColor: kBackgroundColor,
          selectedLabelStyle: const TextStyle(fontFamily: "Cairo"),
          unselectedLabelStyle: const TextStyle(fontFamily: "Cairo"),
          elevation: 2.0,
          items: controller.items,
        ),
      );
    });
  }
}
