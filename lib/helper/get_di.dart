import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import '../controller/dashboard_controller.dart';
import '../controller/order_controller.dart';

Future<void> init() async {
  // Auth Controller
  Get.lazyPut(() => AuthController(), fenix: true);

  // DashBoard Controller
  Get.lazyPut(() => DashBoardController(), fenix: true);

  // Order Controller
  Get.lazyPut(() => OrderController(), fenix: true);
}
