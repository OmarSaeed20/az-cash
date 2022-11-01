import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/size_config.dart';
import '../../../../utils/other_methods.dart';
import '../../../../models/order_model.dart';
import '../../../widgets/custom_text.dart';
import '../../apply/apply_for_financing_screen.dart';

class CustomCardOrder extends StatelessWidget {
  const CustomCardOrder({Key? key, required this.order}) : super(key: key);

  final Order order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: EdgeInsetsDirectional.all(getProportionateScreenHeight(10.0)),
      margin: EdgeInsetsDirectional.only(
          bottom: getProportionateScreenHeight(10.0)),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        children: [
          CustomRowText(title: "رقم الطلب", subTitle: order.id!),
          CustomRowText(
            title: "مبلغ التمويل",
            subTitle: "${order.amountFunding!} EGP",
          ),
          CustomRowText(
            title: "الكل",
            subTitle: "${OtherMethods.totalAmount(order)} EGP",
          ),
          CustomRowText(
            title: "فترة التاخير",
            subTitle: "${order.periodLate!} day",
          ),
          Row(
            children: [
              const CustomText(
                text: "حالة الطلب:",
                fontSize: 14.0,
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      4.0,
                      2.0,
                      4.0,
                      2.0,
                    ),
                    decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: order.isPay!.isNotEmpty
                          ? const BorderRadius.only(
                              topRight: Radius.circular(2.0),
                              bottomRight: Radius.circular(2.0),
                            )
                          : BorderRadius.circular(2.0),
                    ),
                    child: CustomText(
                      text: order.orderStatus!,
                      fontSize: 12.0,
                      color: kWhiteColor,
                    ),
                  ),
                  if (order.isPay!.isNotEmpty)
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        4.0,
                        2.0,
                        4.0,
                        2.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF388E3C),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2.0),
                          bottomLeft: Radius.circular(2.0),
                        ),
                      ),
                      child: CustomText(
                        text: order.isPay!,
                        fontSize: 12.0,
                        color: kWhiteColor,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
