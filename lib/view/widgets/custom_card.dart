import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.value,
    required this.onTap,
  }) : super(key: key);
  final String value;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //height: getProportionateScreenHeight(46.0),
        width: SizeConfig.screenWidth,
        padding: EdgeInsetsDirectional.only(
          start: getProportionateScreenWidth(15.0),
          top: getProportionateScreenHeight(12.5),
          bottom: getProportionateScreenHeight(12.5),
        ),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomText(
            text: value,
            color: kBlackColor.withOpacity(0.70),
          ),
        ),
      ),
    );
  }
}
