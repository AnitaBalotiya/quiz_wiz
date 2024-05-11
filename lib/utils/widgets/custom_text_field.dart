import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helper/global.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController etText;
  final String? hintText;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? textInputType;
  // final InputBorder? focusedBorder;
  // final InputBorder? enabledBorder;
  final bool? obscureText;
  final int? maxLines;
  final bool roundedBorder;
  final Function(String value)? onChanged;

  const CustomTextField(
      {super.key,
      required this.etText,
      this.hintText,
      this.textAlign,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.textInputFormatter,
      this.textInputType,
      // this.enabledBorder,
      // this.focusedBorder,
      this.maxLines = 1,
      this.roundedBorder = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    //
    return TextFormField(
        controller: etText,
        cursorHeight: mq.width * .06,
        cursorColor: pColor,
        inputFormatters: textInputFormatter,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        maxLines: maxLines,

        //
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: mq.width * .03, horizontal: mq.width * .05),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
            isDense: true,

            //

            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder));
  }
}
