import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../controller/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_pin_code_field.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key, this.phoneNumber}) : super(key: key);
  final String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(elevation: 0.0),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              getProportionateScreenWidth(15.0),
              getProportionateScreenHeight(40.0),
              getProportionateScreenWidth(15.0),
              getProportionateScreenHeight(15.0),
            ),
            child: GetBuilder<AuthController>(
              builder: (authController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "تحقق من رقم هاتفك الخاص بك",
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    kHeightBox20,
                    const CustomText(
                      text: "أدخل الكود المكون من 6 أرقام الذي سيرسل إليك",
                      fontSize: 16.0,
                      color: kGreyColor,
                    ),
                    CustomText(
                      text: "$phoneNumber 20+",
                      fontSize: 18.0,
                      fontFamily: "OpenSans",
                      color: kPrimaryColor,
                    ),
                    kHeightBox60,
                    CustomPinCodeField(authController: authController),
                    kHeightBox40,
                    CustomButton(
                      title: "تاكيد",
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const CustomLoader(),
                        );
                        authController.smsCodeSubmitted(context);
                      },
                    ),
                    kHeightBox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: "لم تستلم رمز التحقق؟",
                          fontSize: 16.0,
                        ),
                        kWidthBox5,
                        InkWell(
                          onTap: () {},
                          child: const CustomText(
                            text: "إعادة إرسال الرمز",
                            fontSize: 16.0,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
