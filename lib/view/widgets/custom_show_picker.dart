import 'package:flutter/cupertino.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomShowPicker extends StatefulWidget {
  const CustomShowPicker({Key? key, required this.array}) : super(key: key);
  final List<String> array;
  @override
  State<CustomShowPicker> createState() => _CustomShowPickerState();
}

class _CustomShowPickerState extends State<CustomShowPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(200.0),
      child: CupertinoPicker(
        itemExtent: 64,
        diameterRatio: 0.8,
        onSelectedItemChanged: (index) => setState(() => currentIndex = index),
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: kIndigoColor.withOpacity(0.15),
        ),
        children: modelBuilder<String>(
          widget.array,
          (index, value) {
            final isSelected = currentIndex == index;
            final color = isSelected ? kBlackColor : kGreyColor;

            return Center(
              child: CustomText(
                text: value,
                fontSize: 18.0,
                color: color,
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> modelBuilder<String>(List<String> models,
          Widget Function(int index, String model) builder) =>
      models
          .asMap()
          .map<int, Widget>((index, model) => MapEntry(
                index,
                builder(index, model),
              ))
          .values
          .toList();
}
