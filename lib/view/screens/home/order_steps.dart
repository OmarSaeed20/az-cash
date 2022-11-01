import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../widgets/custom_column_img_and_text.dart';

class OrderSteps extends StatelessWidget {
  const OrderSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomColumnImgText(
          image: Images.document,
          text: "الطلب",
        ),
        SvgPicture.asset(
          Images.arrow,
          height: getProportionateScreenHeight(25.0),
          width: getProportionateScreenHeight(25.0),
          color: const Color(0xFF26C6DA),
        ),
        const CustomColumnImgText(
          image: Images.waiting,
          text: "الموافقة",
        ),
        SvgPicture.asset(
          Images.arrow,
          height: getProportionateScreenHeight(25.0),
          width: getProportionateScreenHeight(25.0),
          color: const Color(0xFF26C6DA),
        ),
        const CustomColumnImgText(
          image: Images.wallet,
          text: "التمويل",
        ),
      ],
    );
  }
}
