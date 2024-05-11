import 'package:flutter/material.dart';

import '../../helper/global.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double fontSize;
  final bool whiteBtn;
  final double? hPadding, vPadding;

  const CustomBtn(
      {super.key,
      required this.onTap,
      required this.text,
      this.fontSize = 18,
      this.whiteBtn = false,
      this.hPadding,
      this.vPadding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: borderRadius(12),
        onTap: onTap,
        child: Container(

            //
            padding: EdgeInsets.symmetric(
                horizontal: hPadding ?? mq.width * .18,
                vertical: vPadding ?? mq.height * .01),

            //
            decoration: BoxDecoration(
                border: Border.all(color: whiteBtn ? pColor : Colors.white),
                borderRadius: borderRadius(22),
                color: whiteBtn ? Colors.white : pColor),

            //
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: .8,
                    color: whiteBtn ? Colors.black54 : Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600))));
  }
}
