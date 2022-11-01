import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomInputForm extends StatelessWidget {
  ///input form
  final String? hintText;
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onTap;
  final Function? validation;
  final bool isNumber;
  //is country

  final IconData? icon;
  final IconData? prefixIcon;
  final int? maxLines;
  final String? preText;

  final double borderWidth;
  final Color? shadowColor;
  final Color borderColor;
  final bool isProtected;
  final bool? isEditable;
  //is country
  final bool isCountry;
  final bool centerText;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextInputType? keyType;
  final double? height;
  final double radius;
  final bool absorbing;

  const CustomInputForm({
    Key? key,
    this.preText,
    this.prefixIcon,
    this.isEditable,
    this.maxLines,
    this.shadowColor,
    this.centerText = false,
    this.validation,
    this.focusNode,
    this.autoFocus = false,
    this.isProtected = false,
    this.isCountry = false,
    this.hintText,
    this.icon,
    this.controller,
    this.keyType = TextInputType.name,
    this.onChanged,
    this.onTap,
    this.height,
    this.borderColor = const Color(0xFF808080),
    this.radius = 5,
    this.borderWidth = 0.30,
    this.absorbing = !true,
    this.isNumber = !true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: maxLines == null ? getProportionateScreenHeight(44.0) : height,
        decoration: BoxDecoration(
          //  color: Theme.of(context).cardColor,
          border: Border.all(width: borderWidth, color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Row(
          children: [
            SizedBox(
              child: isCountry
                  ? Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6.5,
                          child: const Center(
                            child: CustomText(
                              text: '+2',
                              fontWeight: FontWeight.bold,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          width: .25,
                          height: maxLines == null
                              ? getProportionateScreenWidth(44.0)
                              : height,
                          color: const Color(0xFF808080),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            Expanded(
              child: AbsorbPointer(
                absorbing: absorbing,
                child: TextFormField(
                  maxLines: maxLines ?? 1,
                  enabled: isEditable,
                  validator: validation as String? Function(String?)?,
                  controller: controller,
                  keyboardType: keyType,
                  obscureText: isProtected,
                  obscuringCharacter: '*',
                  onChanged: onChanged as void Function(String?)?,
                  onTap: onTap as void Function()?,
                  focusNode: focusNode,
                  textAlign:
                      centerText == true ? TextAlign.center : TextAlign.start,
                  autofocus: autoFocus,
                  cursorColor: const Color(0xFF808080),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: isNumber == true ? "OpenSans" : "Cairo",
                  ),
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 12, height: 0.3),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    prefixText: preText,
                    prefixStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    prefixIcon: prefixIcon != null
                        ? Icon(
                            prefixIcon,
                            color: const Color(0xFFC4C4C4),
                          )
                        : null,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Cairo",
                      color: kGreyColor,
                      height: 1.0,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    alignLabelWithHint: false,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String countryFlag() {
  String countryCode = 'eg';

  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}
