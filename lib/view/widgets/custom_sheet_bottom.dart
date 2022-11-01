import 'package:flutter/cupertino.dart';
import 'custom_text.dart';

void customSheetBottom(
  BuildContext context, {
  required Widget child,
  required VoidCallback onTap,
}) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        child,
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: onTap,
        child: const CustomText(
          text: "موافق",
        ),
      ),
    ),
  );
}
