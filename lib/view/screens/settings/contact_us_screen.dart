import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../../utils/other_methods.dart';
import '../../widgets/custom_text.dart';
import 'widgets/custom_card_connect.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "اتصل بنا",
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          getProportionateScreenHeight(15.0),
          getProportionateScreenHeight(20.0),
          getProportionateScreenHeight(15.0),
          0.0,
        ),
        child: Column(
          children: [
            CustomCardConnect(
              title: "WhatsApp",
              isCairo: !true,
              number: whatsApp,
              text: "Copy",
              onTap: () => OtherMethods.copyValue(whatsApp),
            ),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            CustomCardConnect(
              title: "خدمة العملاء",
              number: customerServices,
              text: "Call",
              onTap: () => OtherMethods.call(url: "tel:$customerServices"),
            ),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            CustomCardConnect(
              title: "البريد الالكتروني",
              number: email,
              text: "Copy",
              onTap: () => OtherMethods.copyValue(email),
            ),
          ],
        ),
      ),
    );
  }
}
