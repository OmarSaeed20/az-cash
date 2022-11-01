import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constants/colors.dart';
import '../../constants/size_config.dart';
import '../../controller/auth_controller.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField({Key? key, required this.authController})
      : super(key: key);
  final AuthController authController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: kGreyColor,
        keyboardType: TextInputType.phone,
        length: 6,
        obscureText: !true,
        animationType: AnimationType.scale,
        textStyle: const TextStyle(
          fontFamily: "OpenSans",
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(4),
          fieldHeight: getProportionateScreenHeight(50.0),
          fieldWidth: getProportionateScreenWidth(40.0),
          borderWidth: 0.5,
          activeColor: kSecondaryColor,
          inactiveColor: kSecondaryColor.withOpacity(0.4),
          inactiveFillColor: kWhiteColor,
          activeFillColor: kWhiteColor,
          selectedColor: kSecondaryColor,
          selectedFillColor: kWhiteColor,
        ),
        animationDuration: const Duration(milliseconds: 200),
        //  backgroundColor: kTransparentColor,
        enableActiveFill: true,
        onCompleted: (code) {
          authController.smsCode = code;
        },
        onChanged: (value) {
          authController.smsCode = value;
          debugPrint("----------------> $value");
        },
      ),
    );
  }
}
