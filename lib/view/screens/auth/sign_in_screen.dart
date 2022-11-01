import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../controller/auth_controller.dart';
import '../../widgets/custom_input_form.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    text: "اهلا بك,",
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  kHeightBox5,
                  const CustomText(
                    text: "الرجاء إدخال رقم الهاتف الخاص بك للتحقق \nمن حسابك.",
                    fontSize: 16.5,
                    color: kGreyColor,
                  ),
                  kHeightBox80,
                  CustomInputForm(
                    hintText: "الرجاء إدخال رقم الهاتف",
                    controller: authController.phoneController,
                    isCountry: true,
                    isNumber: true,
                    keyType: TextInputType.number,
                    onChanged: (String? value) {
                      value = authController.phoneController.text;
                      debugPrint("------> $value");
                    },
                  ),
                  kHeightBox40,
                  CustomButton(
                    title: "تسجيل الدخول",
                    onPressed: () {
                      if (authController.phoneController.text.isEmpty) {
                        customShowSnackBar(
                            "برجاء إدخال رقم الهاتف لتسجيل الدخول");
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const CustomLoader(),
                        );
                        authController.phoneNumberSubmitted(context);
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
