import 'package:flutter/cupertino.dart';

import '../../constants/size_config.dart';
import 'custom_sheet_bottom.dart';

void customShowDatePicker(
  BuildContext context, {
  required Function(DateTime) onChanged,
  required VoidCallback onTap,
}) {
  DateTime dateTime = DateTime.now();
  customSheetBottom(
    context,
    child: SizedBox(
      height: getProportionateScreenHeight(200.0),
      child: CupertinoDatePicker(
        initialDateTime: dateTime,
        minimumYear: 1950,
        maximumYear: 2050,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onChanged,
      ),
    ),
    onTap: onTap,
  );
}
