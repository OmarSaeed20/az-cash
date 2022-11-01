import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomColumnImgText extends StatelessWidget {
  const CustomColumnImgText({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: getProportionateScreenHeight(25.0),
          width: getProportionateScreenHeight(25.0),
        ),
        kHeightBox10,
        CustomText(
          text: text,
          fontSize: 12.0,
          color: kWhiteColor,
        ),
      ],
    );
  }
}
