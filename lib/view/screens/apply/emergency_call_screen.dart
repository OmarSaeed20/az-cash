import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../../helper/route_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_row_img_and_text.dart';
import '../../widgets/custom_sheet_bottom.dart';
import '../../widgets/custom_show_picker.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class EmergencyCallScreen extends StatelessWidget {
  const EmergencyCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "الاتصال بالطوارئ",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(10.0),
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(10.0),
        ),
        child: GetBuilder<OrderController>(
          builder: (orderController) => Column(
            children: [
              const CustomRowImgText(
                image: Images.warning,
                text: "برجاء اختيار 2 مختلفين من قوائم الاتصال",
                colorImg: kSecondaryColor,
                colorText: kSecondaryColor,
              ),
              SizedBox(height: getProportionateScreenHeight(20.0)),
              const CustomRowImgText(
                image: Images.user,
                text: "أول رقم هاتف للاتصال في حالة الطوارئ",
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              CustomCard(
                value: orderController.relationF ?? "القرابة",
                onTap: () {
                  customSheetBottom(
                    context,
                    child: CustomShowPicker(array: relationFirst),
                    onTap: () {
                      orderController
                          .changeRelationFValue(relationFirst[currentIndex]);

                      Get.back();
                    },
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              CustomCard(
                value: orderController.emergencyFirst == null
                    ? "اضعط هنا"
                    : "${orderController.emergencyFirst!.nameContact}\n${orderController.emergencyFirst!.phone}",
                onTap: () => orderController.openContacts(true),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30.0),
              ),
              const CustomRowImgText(
                image: Images.user,
                text: "ثاني رقم هاتف للاتصال في حالة الطوارئ",
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              CustomCard(
                value: orderController.relationS ?? "القرابة",
                onTap: () {
                  customSheetBottom(
                    context,
                    child: CustomShowPicker(array: relationSecond),
                    onTap: () {
                      orderController
                          .changeRelationSValue(relationSecond[currentIndex]);

                      Get.back();
                    },
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              CustomCard(
                value: orderController.emergencySecond == null
                    ? "اضعط هنا"
                    : "${orderController.emergencySecond!.nameContact}\n${orderController.emergencySecond!.phone}",
                onTap: () => orderController.openContacts(!true),
              ),
              const Spacer(),
              CustomButton(
                title: "استمر",
                onPressed: () {
                  if (orderController.emergencyFirst == null ||
                      orderController.emergencySecond == null ||
                      orderController.relationF == null ||
                      orderController.relationS == null) {
                    customShowSnackBar("برجاء إدخال البيانات المطلوبة");
                  } else {
                    Get.toNamed(RouteHelper.infoWallet);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
