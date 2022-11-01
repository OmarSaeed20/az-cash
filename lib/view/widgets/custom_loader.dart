import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Dialog(
      elevation: 0.0,
      backgroundColor: kTransparentColor,
      child: SpinKitFadingCircle(
        color: kSecondaryColor,
        size: 50.0,
      ),
    );
  }
}
