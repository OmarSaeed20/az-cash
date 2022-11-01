import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/size_config.dart';
import 'custom_text.dart';

class CustomAddImageBtn extends StatelessWidget {
  const CustomAddImageBtn({
    Key? key,
    required this.onTap,
    required this.text,
    this.image,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: DottedBorder(
        color: kBlueColor,
        borderType: BorderType.RRect,
        strokeWidth: 1.0,
        radius: const Radius.circular(4),
        child: Container(
          width: SizeConfig.screenWidth,
          color: const Color(0xFFD5E7FF),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              CustomText(
                text: text,
                fontSize: 14.0,
              ),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              if (image != null)
                Expanded(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
