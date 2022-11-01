import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../constants/size_config.dart';
import '../../../controller/auth_controller.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_text.dart';
import '../orders/orders_screen.dart';
import 'contact_us_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (controller) {
          return controller.isLoaded == true
              ? const CustomLoader()
              : Column(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(200.0),
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenWidth(20.0),
                      ),
                      color: kPrimaryColor,
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: CustomText(
                          text: controller.userModel!.phoneNumber!
                              .substring(2)
                              .toString(),
                          fontFamily: "OpenSans",
                          fontSize: 22.0,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    CustomListTile(
                      image: Images.history,
                      text: "لائحة الطلبات",
                      onTap: () => Get.to(() => const OrdersScreen()),
                    ),
                    CustomListTile(
                      image: Images.contactUs,
                      text: "اتصل بنا",
                      onTap: () => Get.to(() => const ContactUsScreen()),
                    ),
                    CustomListTile(
                      image: Images.signOut,
                      text: "تسجيل الخروج",
                      onTap: () => controller.signOut(),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
