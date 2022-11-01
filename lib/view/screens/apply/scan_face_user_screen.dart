import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

import '../../../constants/colors.dart';
import '../../../constants/size_config.dart';
import '../../../controller/order_controller.dart';
import '../../../main.dart';
import '../../widgets/custom_text.dart';
import 'attachments_screen.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    this.customPaint,
    this.text,
    this.onImage,
    this.initialDirection = CameraLensDirection.front,
  }) : super(key: key);

  final CustomPaint? customPaint;
  final String? text;
  final Function(InputImage inputImage)? onImage;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  File? _image;
  String? _path;
  int? _cameraIndex = 0;

  @override
  void initState() {
    super.initState();
    if (cameras!.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras!.indexOf(cameras!.firstWhere(
        (element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90,
      ));
    } else {
      _cameraIndex = cameras!.indexOf(
        cameras!.firstWhere(
          (element) => element.lensDirection == widget.initialDirection,
        ),
      );
    }
    _startLiveFeed();
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "معرف الوجه",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: _body(),
      floatingActionButton: _cameraActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _cameraActionButton() {
    return SizedBox(
      height: getProportionateScreenHeight(90.0),
      width: getProportionateScreenWidth(90.0),
      child: FloatingActionButton(
        onPressed: onTakePictureButtonPressed,
        backgroundColor: kTransparentColor,
        elevation: 0.0,
        child: Icon(
          Icons.camera,
          size: getProportionateScreenHeight(60.0),
        ),
      ),
    );
  }

  Widget _body() {
    if (_controller!.value.isInitialized == !true) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Container(
      color: kBlackColor,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Center(
              child: CameraPreview(_controller!),
            ),
          ),
          if (widget.customPaint != null) widget.customPaint!,
        ],
      ),
    );
  }

  void onTakePictureButtonPressed() async {
    await _controller?.stopImageStream();
    await takePicture().then((XFile? xFile) async {
      if (mounted) {
        if (xFile != null) {
          _processPickedFile(xFile);
        }
      }
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AttachmentsScreen(image: _image),
        ),
        (route) => !true,
      );
      Get.find<OrderController>().imageUser = _image;
      debugPrint('path %%% $_path');
      setState(() {});
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController cameraController = _controller!;

    /* if (cameraController == null || cameraController.value.isInitialized) {
       return null;
     }*/
    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile xFile = await cameraController.takePicture();
      return xFile;
    } on CameraException catch (error) {
      debugPrint("---->  $error");
      return null;
    }
  }

  Future _startLiveFeed() async {
    final camera = cameras![_cameraIndex!];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }

      _controller?.startImageStream(_processCameraImage);
      setState(() {});
    });
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    //  _controller = null;
  }

  Future _processPickedFile(XFile xFile) async {
    String? path = xFile.path;
    if (path.isEmpty) {
      return;
    }
    setState(() {
      _image = File(path);
    });
    _path = path;
    final inputImage = InputImage.fromFilePath(path);
    widget.onImage!(inputImage);
  }

  Future _processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras![_cameraIndex!];
    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw);
    if (inputImageFormat == null) return;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage!(inputImage);
  }
}
