import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/order_model.dart';

class OtherMethods {
  // Collect Values
  static double totalAmount(Order order) {
    return double.parse(order.totalAmount!) + double.parse(order.feeLate!);
  }

  // Copy
  static void copyValue(String val) {
    Clipboard.setData(ClipboardData(text: val));
  }

  // Call
  static Future<void> call({required String url}) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could Not Launch $url');
    }
  }
}
