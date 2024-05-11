import 'package:flutter/material.dart';

import '../../helper/global.dart';
import '../constants/str_const.dart';

class LogoImg extends StatelessWidget {
  const LogoImg({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: borderRadius(24),

        //
        child: Image.asset(StrConst.logo,
            height: mq.height * .18, width: mq.width * .4, fit: BoxFit.cover));
  }
}
