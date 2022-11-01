import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/size_config.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_btn.dart';

class CustomCardConnect extends StatelessWidget {
  const CustomCardConnect({
    Key? key,
    required this.title,
    required this.number,
    required this.text,
    this.isCairo = true,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String number;
  final String text;
  final bool isCairo;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 16.0,
                fontFamily: isCairo ? "Cairo" : "OpenSans",
                color: kBlackColor,
              ),
              SizedBox(height: getProportionateScreenHeight(5.0)),
              CustomText(
                text: number,
                fontSize: 16.0,
                fontFamily: 'OpenSans',
                color: kBlueColor,
              ),
            ],
          ),
          CustomBtn(text: text, onTap: onTap),
        ],
      ),
    );
  }
}
