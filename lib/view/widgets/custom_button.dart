import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [kIndigoColor, kPrimaryColor],
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      height: getProportionateScreenHeight(40.0),
      width: SizeConfig.screenWidth! * 80.0,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: CustomText(
            text: title,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
