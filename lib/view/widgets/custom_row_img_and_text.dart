import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomRowImgText extends StatelessWidget {
  const CustomRowImgText({
    Key? key,
    required this.image,
    required this.text,
    this.colorImg,
    this.colorText,
  }) : super(key: key);
  final String image;
  final String text;
  final Color? colorImg;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          height: getProportionateScreenHeight(22.0),
          width: getProportionateScreenHeight(22.0),
          color: colorImg ?? kGreyColor,
        ),
        kWidthBox5,
        Expanded(
          child: CustomText(
            text: text,
            fontSize: 16.0,
            color: colorText ?? kBlackColor,
          ),
        ),
      ],
    );
  }
}
