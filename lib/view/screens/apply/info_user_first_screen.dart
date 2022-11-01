import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../../helper/route_helper.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input_form.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class InfoUserFirstScreen extends StatelessWidget {
  InfoUserFirstScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "المعلومات الشخصية",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            getProportionateScreenWidth(15.0),
            getProportionateScreenHeight(20.0),
            getProportionateScreenWidth(15.0),
            getProportionateScreenHeight(15.0),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFeild(
                  hintText: "الرقم القومي",
                  keyType: TextInputType.number,
                  controller: orderController.nationalIdController,
                  isNumber: true,
                  onChanged: (val) {
                    val != orderController.nationalIdController.text;
                    log(orderController.nationalIdController.text);
                  },
                ),
                CustomTextFeild(
                  hintText: "الاسم الاول",
                  controller: orderController.nameContoller,
                  onChanged: (val) {
                    val != orderController.nameContoller.text;
                    log(orderController.nameContoller.text);
                  },
                ),
                CustomTextFeild(
                  hintText: "اسم العائلة",
                  controller: orderController.nameFamilyController,
                  onChanged: (val) {
                    val != orderController.nameFamilyController.text;
                    log(orderController.nameFamilyController.text);
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFeild(
                        hintText: "المحافظة",
                        controller: orderController.governorateController,
                        onChanged: (val) {
                          val != orderController.governorateController.text;
                          log(orderController.governorateController.text);
                        },
                      ),
                    ),
                    kWidthBox10,
                    Expanded(
                      child: CustomTextFeild(
                        hintText: "القرية",
                        controller: orderController.stateController,
                        onChanged: (val) {
                          val != orderController.stateController.text;
                          log(orderController.stateController.text);
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextFeild(
                  hintText: "العنوان",
                  controller: orderController.addressController,
                  onChanged: (val) {
                    val != orderController.addressController.text;
                    log(orderController.addressController.text);
                  },
                  maxLines: 4,
                ),
                CustomTextFeild(
                  hintText: "البريد الالكتروني",
                  keyType: TextInputType.emailAddress,
                  controller: orderController.emailController,
                  isNumber: true,
                  onChanged: (val) {
                    val != orderController.emailController.text;
                    log(orderController.emailController.text);
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(80.0)),
                CustomButton(
                  title: "استمر",
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                    } else if (orderController
                                .nationalIdController.text.length <
                            14 ||
                        orderController.nationalIdController.text.length > 14) {
                      customShowSnackBar("برجاء التاكد من الرقم المدخل");
                    } else {
                      (formKey.currentState!.save());
                      Get.toNamed(RouteHelper.infoUserSecond);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.keyType,
    this.maxLines,
    required this.controller,
    this.isNumber = !true,
  }) : super(key: key);
  final String hintText;
  final Function(String?)? onChanged;
  final TextInputType? keyType;
  final int? maxLines;
  final TextEditingController controller;
  final bool isNumber;
  @override
  Widget build(BuildContext context) {
    return CustomInputForm(
      hintText: hintText,
      keyType: keyType ?? TextInputType.name,
      maxLines: maxLines ?? 1,
      controller: controller,
      validation: (val) {
        if (val.isEmpty) {
          return "لا يمكن أن يكون هذا الحقل فارغًا";
        }
      },
      onChanged: onChanged,
      isNumber: isNumber,
    );
  }
}
