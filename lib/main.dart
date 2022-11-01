import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'constants/constants.dart';
import 'constants/size_config.dart';
import 'helper/cache_helper.dart';
import 'helper/get_di.dart';
import 'helper/route_helper.dart';
import 'view/screens/auth/sign_in_screen.dart';
import 'view/screens/dashboard/dashboard_screen.dart';

List<CameraDescription>? cameras;

void main() async {
  // init flutter binding
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await init();
  cameras = await availableCameras();

  await CacheHelper.init();
  isPermission = await CacheHelper.getData(key: "isPermission");
  isLogin = await CacheHelper.getData(key: "isLogin");
  isUploaded = await CacheHelper.getData(key: "isUploaded");
  final Widget home;
  isLogin == true ? home = DashboradScreen() : home = const SignInScreen();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kTransparentColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.home}) : super(key: key);
  final Widget home;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: !true,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      defaultTransition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 200),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kBackgroundColor,
          elevation: 0.40,
          iconTheme: IconThemeData(
            color: kBlackColor,
          ),
          actionsIconTheme: IconThemeData(
            color: kBlackColor,
          ),
        ),
        fontFamily: "OpenSans",
        scaffoldBackgroundColor: kBackgroundColor,
        colorSchemeSeed: kIndigoColor,
      ),
      locale: const Locale('ar'),
      getPages: RouteHelper.routes,
      home: Builder(
        builder: (context) {
          SizeConfig().init(context);
          return home;
        },
      ),
    );
  }
}
