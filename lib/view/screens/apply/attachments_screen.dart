import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order_controller.dart';
import '../../../helper/route_helper.dart';
import '../../../constants/size_config.dart';
import '../../widgets/custom_add_image_btn.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';
import 'scan_id_card_screen.dart';

class AttachmentsScreen extends StatelessWidget {
  const AttachmentsScreen({Key? key, this.image}) : super(key: key);
  final File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "المرفقات",
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
          builder: (orderController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(10.0)),
                Expanded(
                  child: CustomAddImageBtn(
                    text: "الجهة الأمامية للبطاقة الشخصية",
                    image: orderController.imageIdCardFront,
                    onTap: () => Get.to(() =>
                        ScanIdCardScreen(orderController: orderController)),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15.0)),
                Expanded(
                  child: CustomAddImageBtn(
                    text: "الجهة الخلفية للبطاقة الشخصية",
                    image: orderController.imageIdCardBack,
                    onTap: () => Get.to(() => ScanIdCardScreen(
                        isCheck: !true, orderController: orderController)),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15.0)),
                Expanded(
                  child: CustomAddImageBtn(
                    text: "صورة وجه المستخدم",
                    image: image,
                    onTap: () => Get.toNamed(RouteHelper.instructionsImage),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
                CustomButton(
                  title: "استمر",
                  onPressed: () {
                    if (orderController.imageIdCardFront == null ||
                        orderController.imageIdCardBack == null ||
                        orderController.imageUser == null) {
                      customShowSnackBar("برجاء إدخال البيانات المطلوبة");
                    } else {
                      Get.toNamed(RouteHelper.infoUserFirst);
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
