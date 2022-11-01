import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../controller/auth_controller.dart';
import '../../../controller/order_controller.dart';
import '../../widgets/custom_card_image.dart';
import '../../widgets/custom_loader.dart';
import 'apply_now_card.dart';
import 'order_details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>().getUserData();
    Get.find<OrderController>().getOrdersData();
    Get.find<OrderController>().getOrderData();
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenWidth(20.0),
          getProportionateScreenHeight(20.0),
          getProportionateScreenWidth(20.0),
          0.0,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomCardImage(image: Images.feedback, text: "بدون ضمان"),
                  CustomCardImage(
                    image: Images.fast,
                    color: Color(0xFF388E3C),
                    text: "عملية سريعة",
                  ),
                  CustomCardImage(
                    image: Images.phone,
                    color: kSecondaryColor,
                    text: "تقديم اونلاين",
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(60.0)),
              GetBuilder<OrderController>(
                builder: (controller) {
                  if (controller.isLoading == true) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: getProportionateScreenHeight(125.0),
                      ),
                      child: const CustomLoader(),
                    );
                  } else if (controller.order != null) {
                    return OrderDetailsCard(order: controller.order!);
                  } else {
                    return const ApplyNowCard();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
