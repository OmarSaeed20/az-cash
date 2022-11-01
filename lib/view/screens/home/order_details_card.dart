import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../models/order_model.dart';
import '../../../utils/other_methods.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_row_img_and_text.dart';
import '../apply/apply_for_financing_screen.dart';
import 'widgets/custom_show_dialog.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(
        getProportionateScreenWidth(15.0),
        getProportionateScreenHeight(15.0),
        getProportionateScreenWidth(15.0),
        getProportionateScreenHeight(15.0),
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomRowImgText(
            image: Images.warning,
            text:
                "الالتزام بالسداد فى الوقت المحدد سيمنحك زيادة المبالغ المتاحة",
            colorImg: kSecondaryColor,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          CustomRowText(title: "رقم القرض", subTitle: order.id!),
          CustomRowText(title: "حساب المحفظة", subTitle: order.walletNumber!),
          CustomRowText(
            title: "رقم البطاقة",
            subTitle: order.nationalIdNumber!,
          ),
          if (order.paymentDate!.isNotEmpty)
            CustomRowText(title: "موعد السداد", subTitle: order.paymentDate!),
          CustomRowText(
            title: "مبلغ التمويل",
            subTitle: "${order.amountFunding!} EGP",
          ),
          CustomRowText(
            title: "رسوم الخدمة",
            subTitle: "${order.serviceFee!} EGP",
          ),
          CustomRowText(
            title: "فترة التاخير",
            subTitle: "${order.periodLate!} day",
          ),
          CustomRowText(
            title: "رسوم التاخير",
            subTitle: "${order.feeLate!} EGP",
          ),
          CustomRowText(
            title: "الكل",
            subTitle: "${OtherMethods.totalAmount(order)} EGP",
          ),
          if (order.paymentDate!.isNotEmpty)
            SizedBox(
              width: SizeConfig.screenWidth! * 0.40,
              child: CustomBtn(
                text: "سدد الان",
                isArabic: true,
                onTap: () {
                  Get.defaultDialog(
                    backgroundColor: kBackgroundColor,
                    radius: 10.0,
                    title: "طريقة السداد",
                    titleStyle: const TextStyle(
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                    ),
                    content: DialogContent(
                      amount: "${OtherMethods.totalAmount(order)} EGP",
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
