import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

void customShowSnackBar(String message,
    {bool isError = true, String fontFamily = "Cairo"}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: isError ? kRedColor : kBlueColor,
      message: message,
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: fontFamily,
          color: kWhiteColor,
        ),
      ),
      maxWidth: 1170,
      duration: const Duration(seconds: 4),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 5,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ),
  );
}
