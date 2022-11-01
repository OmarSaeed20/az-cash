import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({
    Key? key,
    required this.image,
    required this.text,
    this.color = const Color(0xF3E7B436),
  }) : super(key: key);
  final String image;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(85.0),
      width: getProportionateScreenHeight(85.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: kWhiteColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getProportionateScreenHeight(35.0),
              width: getProportionateScreenHeight(35.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: color,
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  height: getProportionateScreenHeight(20.0),
                  width: getProportionateScreenHeight(20.0),
                  color: kWhiteColor,
                ),
              ),
            ),
            kHeightBox5,
            CustomText(
              text: text,
              fontSize: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
