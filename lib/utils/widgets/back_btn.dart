import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackBtn extends StatelessWidget {
  final Color iconColor;
  const BackBtn({super.key, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Get.back(),
        icon: Icon(CupertinoIcons.chevron_back, color: iconColor));
  }
}
