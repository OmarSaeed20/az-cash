import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_text.dart';
import 'widgets/custom_card_order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "لائحة الطلبات",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: GetBuilder<OrderController>(
        builder: (controller) {
          if (controller.isLoading == true) {
            return const CustomLoader();
          } else {
            if (controller.orders.isEmpty) {
              return const Center(
                child: CustomText(text: "غير متوفر طلبات هنا"),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsetsDirectional.fromSTEB(
                  getProportionateScreenWidth(10.0),
                  getProportionateScreenHeight(20.0),
                  getProportionateScreenWidth(10.0),
                  0.0,
                ),
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  return CustomCardOrder(
                    order: controller.orders[index],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
