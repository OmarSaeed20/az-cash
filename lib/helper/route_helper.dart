import 'package:get/get.dart';

import '../view/screens/apply/apply_for_financing_screen.dart';
import '../view/screens/apply/attachments_screen.dart';
import '../view/screens/apply/emergency_call_screen.dart';
import '../view/screens/apply/info_user_first_screen.dart';
import '../view/screens/apply/info_user_second_screen.dart';
import '../view/screens/apply/info_user_third_screen.dart';
import '../view/screens/apply/info_wallet_screen.dart';
import '../view/screens/apply/instructions_image_screen.dart';
import '../view/screens/apply/scan_id_card_screen.dart';
import '../view/screens/auth/sign_in_screen.dart';
import '../view/screens/auth/verification_code_screen.dart';
import '../view/screens/orders/orders_screen.dart';
import '../view/screens/settings/contact_us_screen.dart';

class RouteHelper {
  static const String signIn = "/signIn_screen";
  static const String verificationCode = "/verification_code_screen";
  static const String attachments = "/attachments_screen";
  static const String scanIdCard = "/scan_id_card_screen";
  static const String instructionsImage = "/instructions_image_user_screen";
  static const String infoUserFirst = "/info_first_user_screen";
  static const String infoUserSecond = "/info_second_user_screen";
  static const String infoUserThird = "/info_third_user_screen";
  static const String ordersRoute = "/orders_screen";
  static const String infoWallet = "/info_wallet_screen";
  static const String applyFinancing = "/apply_for_financing_screen";
  static const String emergencyCall = "/emergency_call_screen";
  static const String contactUs = "/contact_us_screen";

  static List<GetPage> routes = [
    GetPage(name: signIn, page: () => const SignInScreen()),
    GetPage(name: verificationCode, page: () => const VerificationCodeScreen()),
    GetPage(name: attachments, page: () => const AttachmentsScreen()),
    GetPage(
        name: scanIdCard,
        page: () => ScanIdCardScreen(orderController: Get.find())),
    GetPage(
        name: instructionsImage, page: () => const InstructionsImageScreen()),
    GetPage(name: infoUserFirst, page: () => InfoUserFirstScreen()),
    GetPage(name: infoUserSecond, page: () => const InfoUserSecondScreen()),
    GetPage(name: infoUserThird, page: () => const InfoUserThirdScreen()),
    GetPage(name: ordersRoute, page: () => const OrdersScreen()),
    GetPage(name: applyFinancing, page: () => const ApplyForFinancingScreen()),
    GetPage(name: infoWallet, page: () => const InfoWalletScreen()),
    GetPage(name: emergencyCall, page: () => const EmergencyCallScreen()),
    GetPage(name: emergencyCall, page: () => const ContactUsScreen()),
  ];
}
