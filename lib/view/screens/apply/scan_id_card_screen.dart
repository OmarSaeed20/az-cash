import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';

import '../../../constants/colors.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../widgets/custom_text.dart';

class ScanIdCardScreen extends StatefulWidget {
  const ScanIdCardScreen(
      {Key? key, this.isCheck = true, required this.orderController})
      : super(key: key);
  final bool isCheck;
  final OrderController orderController;
  @override
  State<ScanIdCardScreen> createState() => _ScanIdCardScreenState();
}

class _ScanIdCardScreenState extends State<ScanIdCardScreen> {
  OverlayFormat format = OverlayFormat.cardID3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: FutureBuilder<List<CameraDescription>>(
          future: availableCameras(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const CustomText(
                  text: 'No camera found',
                  fontSize: 24.0,
                  color: kBlackColor,
                );
              }
              return CameraOverlay(
                snapshot.data!.first,
                CardOverlay.byFormat(format),
                (XFile xFile) {
                  File image = File(xFile.path);

                  widget.isCheck
                      ? widget.orderController
                          .getFileImage(image, widget.isCheck)
                      : widget.orderController
                          .getFileImage(image, widget.isCheck);
                  Navigator.pop(context);

                  //   showDialog(
                  //     context: context,
                  //     barrierDismissible: false,
                  //     //barrierColor: kWhiteColor,
                  //     builder: (context) {
                  //       CardOverlay overlay = CardOverlay.byFormat(format);
                  //       return AlertDialog(
                  //         actionsAlignment: MainAxisAlignment.center,
                  //         backgroundColor: kBackgroundColor,
                  //         title: const CustomText(
                  //           text: 'التقاط صورة',
                  //         ),
                  //         actions: [],
                  //         content: SizedBox(
                  //           width: double.infinity,
                  //           child: AspectRatio(
                  //             aspectRatio: overlay.ratio!,
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(4),
                  //                 image: DecorationImage(
                  //                   fit: BoxFit.cover,
                  //                   alignment: FractionalOffset.center,
                  //                   image: FileImage(
                  //                     File(xFile.path),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   );
                },
              );
            } else {
              return const CustomText(
                text: 'Fetching cameras',
                fontSize: 24.0,
                color: kBlackColor,
              );
            }
          },
        ),
      ),
    );
  }
}
