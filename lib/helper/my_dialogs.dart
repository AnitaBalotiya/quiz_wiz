import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/widgets/custom_loading.dart';
import 'global.dart';

class MyDialogs {
  static const snackbarCurve = Curves.easeInOutCubic;
  static const snackPosition = SnackPosition.BOTTOM;

  static void error({required String msg}) {
    Get.snackbar('Error', msg,
        forwardAnimationCurve: snackbarCurve,
        reverseAnimationCurve: snackbarCurve,
        snackPosition: snackPosition,

        //
        icon: const Icon(CupertinoIcons.exclamationmark_circle_fill,
            color: Colors.white),
        backgroundColor: Colors.redAccent.withOpacity(.8),
        colorText: Colors.white);
  }

  static void success({required String msg}) {
    Get.snackbar('Success', msg,
        forwardAnimationCurve: snackbarCurve,
        reverseAnimationCurve: snackbarCurve,
        snackPosition: snackPosition,

        //
        icon: const Icon(CupertinoIcons.check_mark_circled_solid,
            color: Colors.white),
        backgroundColor: pColor,
        colorText: Colors.white);
  }

  static void info(
      {required String msg, SnackPosition position = snackPosition}) {
    Get.snackbar('Info', msg,
        colorText: Colors.white,
        backgroundColor: pColor,
        snackPosition: position);
  }

  static void showProgressBar() {
    Get.dialog(barrierDismissible: false, const Center(child: CustomLoading()));
  }
}
