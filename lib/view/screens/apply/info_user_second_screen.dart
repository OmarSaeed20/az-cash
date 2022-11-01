import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../../helper/route_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_sheet_bottom.dart';
import '../../widgets/custom_show_date_picker.dart';
import '../../widgets/custom_show_picker.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class InfoUserSecondScreen extends StatelessWidget {
  const InfoUserSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "المعلومات الشخصية",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(20.0),
          getProportionateScreenWidth(15.0),
          getProportionateScreenHeight(15.0),
        ),
        child: GetBuilder<OrderController>(
          builder: (controller) {
            return Column(
              children: [
                CustomCard(
                  value: controller.birthday ?? "تاريخ الميلاد",
                  onTap: () {
                    customShowDatePicker(
                      context,
                      onChanged: (DateTime dateTime) {
                        controller.birthday = DateFormat.yMd().format(dateTime);
                      },
                      onTap: () {
                        controller.birthday ??=
                            DateFormat.yMd().format(DateTime.now());
                        controller.changeBirthday(controller.birthday!);
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.releaseDate ?? "تاريخ الاصدار",
                  onTap: () {
                    customShowDatePicker(
                      context,
                      onChanged: (DateTime dateTime) {
                        controller.releaseDate =
                            DateFormat.yM().format(dateTime);
                      },
                      onTap: () {
                        controller.releaseDate ??=
                            DateFormat.yMd().format(DateTime.now());
                        controller.changeRelease(controller.releaseDate!);
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.expiryDate ?? "انتهاء الصلاحية",
                  onTap: () {
                    customShowDatePicker(
                      context,
                      onChanged: (DateTime dateTime) {
                        controller.expiryDate =
                            DateFormat.yMd().format(dateTime);
                      },
                      onTap: () {
                        controller.expiryDate ??=
                            DateFormat.yMd().format(DateTime.now());
                        controller.changeExpiry(controller.expiryDate!);
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.maritalStatus ?? "الحالة الزوجية",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: statusMarital),
                      onTap: () {
                        controller.maritalStatus = statusMarital[currentIndex];
                        controller.changeMarital(controller.maritalStatus!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.gender ?? "الجنس",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: gender),
                      onTap: () {
                        controller.gender = gender[currentIndex];
                        controller.changeGender(controller.gender!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.statusEducation ?? "الحالة التعليمية",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: educationStatus),
                      onTap: () {
                        controller.statusEducation =
                            educationStatus[currentIndex];
                        controller.changeEducation(controller.statusEducation!);
                        currentIndex = 0;
                        Get.back();
                      },
                    );
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(10.0)),
                CustomCard(
                  value: controller.numberChildren ?? "عدد الاطفال",
                  onTap: () {
                    customSheetBottom(
                      context,
                      child: CustomShowPicker(array: numberChildren),
                      onTap: () {
                        controller.numberChildren =
                            numberChildren[currentIndex];
                        controller.changeChildren(controller.numberChildren!);
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
                    if (controller.birthday == null ||
                        controller.releaseDate == null ||
                        controller.expiryDate == null ||
                        controller.maritalStatus == null ||
                        controller.gender == null ||
                        controller.statusEducation == null ||
                        controller.numberChildren == null) {
                      customShowSnackBar("برجاء إدخال البيانات المطلوبة");
                    } else {
                      Get.toNamed(RouteHelper.infoUserThird);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
