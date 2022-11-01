import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import '../../../constants/size_config.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/order_controller.dart';
import '../../../models/user_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_show_snack_bar.dart';
import '../../widgets/custom_text.dart';

class ApplyForFinancingScreen extends StatelessWidget {
  const ApplyForFinancingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    String financingTime = DateFormat('yyyy-MM-dd').format(now);
    UserModel? model = Get.find<AuthController>().userModel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const CustomText(
          text: "تاكيد الاقتراض",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GetBuilder<OrderController>(
        builder: (orderController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(model!.numbers!.length, (index) {
                      return CustomAvailbleNumber(
                        value: model.numbers![index].toString(),
                        isSelected: orderController.amount!
                            .contains("${model.numbers![index]}"),
                        onTap: () {
                          orderController
                              .changeValue("${model.numbers![index]}");
                          log(orderController.amount!);
                        },
                      );
                    }),
                    SizedBox(width: getProportionateScreenWidth(15.0)),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(60.0)),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: getProportionateScreenWidth(10.0)),
                child: const CustomText(text: "معلومات اساسية:"),
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(
                  getProportionateScreenWidth(15.0),
                  getProportionateScreenHeight(15.0),
                  getProportionateScreenWidth(15.0),
                  0.0,
                ),
                color: kWhiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRowText(
                      title: "مبلغ التمويل",
                      subTitle: orderController.amount!.isEmpty
                          ? "0.0"
                          : "${orderController.amount!} EGP",
                    ),
                    CustomRowText(
                      title: "رسوم الخدمة",
                      subTitle: orderController.amount!.isEmpty
                          ? "0.0"
                          : "${orderController.getFee(orderController.amount!)} EGP",
                    ),
                    CustomRowText(
                      title: "الكل",
                      subTitle: orderController.amount!.isEmpty
                          ? "0.0"
                          : "${orderController.getTotalAmount(orderController.amount!, orderController.fee)} EGP",
                    ),
                    CustomRowText(
                      title: "رقم البطاقة",
                      subTitle: model.nationalIdNumber!.isEmpty
                          ? orderController.nationalIdController.text
                          : model.nationalIdNumber!,
                    ),
                    CustomRowText(
                      title: "حساب المحفظة",
                      subTitle: model.walletType!.isEmpty
                          ? orderController.walletNumController.text
                          : model.walletNumber!,
                    ),
                    CustomRowText(
                      title: "موعد التمويل",
                      subTitle: financingTime,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
                child: CustomButton(
                  title: "يد الاقتراض",
                  onPressed: () {
                    if (orderController.amount!.isEmpty) {
                      customShowSnackBar("برجاء إختيار مبلغ التمويل");
                    } else {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const CustomLoader(),
                      );
                      orderController.uploadOrderData(
                        context: context,
                        timeFinancing: financingTime,
                        model: model,
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomRowText extends StatelessWidget {
  const CustomRowText({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "$title:",
              fontSize: 14.0,
            ),
            CustomText(
              text: subTitle,
              fontSize: 16.0,
              color: kGreyColor,
              fontFamily: "OpenSans",
            ),
          ],
        ),
        SizedBox(height: getProportionateScreenHeight(10.0)),
      ],
    );
  }
}

class CustomAvailbleNumber extends StatelessWidget {
  const CustomAvailbleNumber({
    Key? key,
    required this.value,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final String value;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: getProportionateScreenHeight(50),
        width: getProportionateScreenHeight(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: isSelected ? kIndigoColor : kGreyColor.withOpacity(0.75),
        ),
        child: Center(
          child: CustomText(
            text: value,
            color: kWhiteColor,
            fontSize: 24.0,
            fontFamily: "OpenSans",
          ),
        ),
      ),
    );
  }
}
