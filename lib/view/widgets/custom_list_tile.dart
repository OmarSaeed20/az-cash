import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/images.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.image,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.all(
          getProportionateScreenHeight(15.0),
        ),
        margin: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenHeight(15.0),
          getProportionateScreenHeight(20.0),
          getProportionateScreenHeight(15.0),
          0.0,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: getProportionateScreenHeight(26.0),
              width: getProportionateScreenHeight(26.0),
              color: kSecondaryColor,
            ),
            kWidthBox15,
            CustomText(text: text),
            const Spacer(),
            if (text != "تسجيل الخروج")
              SvgPicture.asset(
                Images.arrowLeft,
                height: getProportionateScreenHeight(14.0),
                width: getProportionateScreenHeight(14.0),
              ),
          ],
        ),
      ),
    );
  }
}
