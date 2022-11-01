import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../utils/face_detector_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class InstructionsImageScreen extends StatelessWidget {
  const InstructionsImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "التعليمات",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(40.0),
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
              text: "يرجي النظر مباشرة إلي الكاميرا\nو إتباع التعليمات",
              fontSize: 20.0,
              color: kGreyColor,
            ),
            SizedBox(
              height: getProportionateScreenHeight(10.0),
            ),
            Image.asset(Images.positionCamera, scale: 3.0),
            SizedBox(height: getProportionateScreenHeight(5.0)),
            const CustomText(text: "الوضع المناسب"),
            SizedBox(height: getProportionateScreenHeight(40.0)),
            const CustomText(
              text: "برجاء الإنتباه إلي النقاط التالية:",
              fontSize: 20.0,
              color: kPrimaryColor,
            ),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            ...List.generate(instructions.length, (index) {
              return Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomText(
                  text: "${index + 1} . ${instructions[index]}",
                  fontSize: 16.5,
                ),
              );
            }),
            const Spacer(),
            CustomButton(
              title: "التقط",
              onPressed: () => Get.to(() => const FaceDetectorView()),
            ),
          ],
        ),
      ),
    );
  }
}
