import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images.dart';
import '../../../../constants/size_config.dart';
import '../../../../utils/other_methods.dart';
import '../../../widgets/custom_row_img_and_text.dart';
import '../../../widgets/custom_text.dart';
import '../../settings/widgets/custom_card_connect.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({Key? key, required this.amount}) : super(key: key);
  final String amount;
  @override
  Widget build(BuildContext context) {
    String phone = "01000100066";
    return SizedBox(
      height: getProportionateScreenHeight(250),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: getProportionateScreenWidth(10.0),
          end: getProportionateScreenWidth(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CustomText(
              text: amount,
              fontSize: 16.0,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              color: kBlueColor,
            ),
            const CustomRowImgText(
              image: Images.warning,
              text: "معلومات المحافظ الالكترونية المتاحة لاستقبال التحويل",
              colorImg: kSecondaryColor,
            ),
            CustomCardConnect(
              title: "رقم المحفظة الاكترونية",
              number: phone,
              text: "Copy",
              onTap: () => OtherMethods.copyValue(phone),
            ),
            CustomCardConnect(
              title: "رقم المحفظة الاكترونية",
              number: phone,
              text: "Copy",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
