import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_input_form.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_row_img_and_text.dart';
import '../../widgets/custom_sheet_bottom.dart';
import '../../widgets/custom_show_picker.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class InfoWalletScreen extends StatelessWidget {
  const InfoWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: !true,
      appBar: AppBar(
        title: const CustomText(
          text: "معلومات المحفطة",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            getProportionateScreenWidth(15.0),
            getProportionateScreenHeight(10.0),
            getProportionateScreenWidth(15.0),
            getProportionateScreenHeight(10.0),
          ),
          child: GetBuilder<OrderController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomRowImgText(
                    image: Images.warning,
                    text:
                        "لضمان عملية الدفع الناجحة يرجي التأكد من صحة حساب المحفظة الذي ادخلته وتنشيط خدمة استلام المبالغ وايداعها",
                    colorImg: kSecondaryColor,
                  ),
                  SizedBox(height: getProportionateScreenHeight(40.0)),
                  CustomCard(
                    value: controller.walletType ?? "اختيار المحفظة",
                    onTap: () {
                      customSheetBottom(
                        context,
                        child: CustomShowPicker(array: networks),
                        onTap: () {
                          controller.walletType = networks[currentIndex];
                          controller.changeWalletType(controller.walletType!);
                          currentIndex = 0;
                          Get.back();
                        },
                      );
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  const CustomText(
                    text: "رقم حساب المحفظة",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10.0)),
                  CustomInputForm(
                    isCountry: true,
                    keyType: TextInputType.number,
                    controller: controller.walletNumController,
                    isNumber: true,
                    onChanged: (val) =>
                        val = controller.walletNumController.text,
                  ),
                  const Spacer(),
                  CustomButton(
                    title: "استمر",
                    onPressed: () {
                      if (controller.walletType == null ||
                          controller.walletNumController.text.isEmpty) {
                        customShowSnackBar("برجاء إدخال البيانات المطلوبة");
                      } else if (controller.walletNumController.text.length >
                          11) {
                        customShowSnackBar("برجاء التاكد من الرقم المدخل");
                      } else if (controller.walletType!
                              .contains("فودافون كاش") &&
                          !controller.walletNumController.text
                              .startsWith("010")) {
                        customShowSnackBar("برجاء التاكد من الرقم المدخل");
                      } else if (controller.walletType!
                              .contains("اوارنج كاش") &&
                          !controller.walletNumController.text
                              .startsWith("012")) {
                        customShowSnackBar("برجاء التاكد من الرقم المدخل");
                      } else if (controller.walletType!
                              .contains("اتصالات كاش") &&
                          !controller.walletNumController.text
                              .startsWith("011")) {
                        customShowSnackBar("برجاء التاكد من الرقم المدخل");
                      } else if (controller.walletType!.contains("وي كاش") &&
                          !controller.walletNumController.text
                              .startsWith("015")) {
                        customShowSnackBar("برجاء التاكد من الرقم المدخل");
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const CustomLoader(),
                        );
                        controller.getUrlImages(context);
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
