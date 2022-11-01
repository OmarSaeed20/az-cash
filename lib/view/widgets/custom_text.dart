import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.fontFamily,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final Color? color;

  final FontWeight? fontWeight;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 18.0,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? "Cairo",
        color: color ?? kBlackColor,
        height: 1.50,
      ),
    );
  }
}
