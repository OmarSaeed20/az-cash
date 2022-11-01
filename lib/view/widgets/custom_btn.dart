import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.text,
    required this.onTap,
    this.isArabic = !true,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final bool isArabic;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenWidth(20.0),
          getProportionateScreenHeight(5.0),
          getProportionateScreenWidth(20.0),
          getProportionateScreenHeight(5.0),
        ),
        decoration: BoxDecoration(
          color: kIndigoColor,
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: 16.0,
            fontFamily: isArabic ? "Cairo" : "OpenSans",
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
