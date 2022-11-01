import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../../helper/route_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_sheet_bottom.dart';
import '../../widgets/custom_show_picker.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class InfoUserThirdScreen extends StatelessWidget {
  const InfoUserThirdScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "معلومات العمل",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(20.0),
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(10.0),
        ),
        child: GetBuilder<OrderController>(
          builder: (controller) {
            return Column(
              children: [
                CustomCard(
                  value: controller.workType ?? "نوع العمل",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: workType),
                      onTap: () {
                        controller.workType = workType[currentIndex];
                        controller.changeTypeWork(controller.workType!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.workNature ?? "طبيعة العمل",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: workNature),
                      onTap: () {
                        controller.workNature = workNature[currentIndex];
                        controller.changeWorkNature(controller.workNature!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                // SizedBox(height: getProportionateScreenHeight(10.0)),
                // CustomContainer(
                //   value: "الوظيفة",
                //   onTap: () {
                //     customSheetBottom(
                //       context,
                //       child: CustomShowPicker(array: []),
                //       onTap: () {},
                //     );
                //   },
                // ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.workingPeriod ?? "مدة العمل",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: workingPeriod),
                      onTap: () {
                        controller.workingPeriod = workingPeriod[currentIndex];
                        controller.changeWorkPeriod(controller.workingPeriod!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.income ?? "الدخل الشهري",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: inCome),
                      onTap: () {
                        controller.income = inCome[currentIndex];
                        controller.changeIncome(controller.income!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                const Spacer(),
                CustomButton(
                    title: "استمر",
                    onPressed: () {
                      if (controller.workType == null ||
                          controller.workNature == null ||
                          controller.workingPeriod == null ||
                          controller.income == null) {
                        customShowSnackBar("برجاء إدخال البيانات المطلوبة");
                      } else {
                        Get.toNamed(RouteHelper.emergencyCall);
                      }
                    }),
              ],
            );
          },
        ),
      ),
    );
  }
}
