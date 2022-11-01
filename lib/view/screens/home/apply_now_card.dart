import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../controller/auth_controller.dart';
import '../../../helper/route_helper.dart';
import '../../widgets/custom_text.dart';
import 'order_steps.dart';

class ApplyNowCard extends StatelessWidget {
  const ApplyNowCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(350.0),
      width: SizeConfig.screenWidth,
      padding: EdgeInsetsDirectional.all(
        getProportionateScreenHeight(20.0),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kSecondaryColor,
      ),
      child: Column(
        children: [
          const CustomText(
            text: "اعلى حد للتمويل",
            fontSize: 22.0,
            color: kWhiteColor,
          ),
          SizedBox(height: getProportionateScreenHeight(20.0)),
          const CustomText(
            text: "18,000",
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: kWhiteColor,
          ),
          SizedBox(height: getProportionateScreenHeight(30.0)),
          Container(
            height: getProportionateScreenHeight(42.0),
            width: SizeConfig.screenWidth! * 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xFF26C6DA),
            ),
            child: TextButton(
              onPressed: () => isPermission == true && isUploaded != true
                  ? Get.toNamed(RouteHelper.attachments)
                  : isPermission == true && isUploaded == true
                      ? Get.toNamed(RouteHelper.applyFinancing)
                      : Get.find<AuthController>().getPermissions(),
              child: const CustomText(
                text: "اطلب الان",
                fontSize: 20.0,
                color: kWhiteColor,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40.0)),
          const CustomText(
            text: "ثلاث خطوات فقط لاتمام طلبك",
            color: kWhiteColor,
          ),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          const OrderSteps(),
        ],
      ),
    );
  }
}
