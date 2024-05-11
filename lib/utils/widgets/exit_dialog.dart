import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../helper/global.dart';
import 'custom_btn.dart';

class ExitDialog {
  static void onTap() {
    Get.dialog(AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,

        //
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Exit',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
          SizedBox(height: mq.height * .02),
          //
          InkWell(
              onTap: () {
                Get.back();
                if (Platform.isAndroid) {
                  launchUrlString("market://details?id=$packageName",
                      mode: LaunchMode.externalApplication);
                }
              },
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //
                ...List.generate(
                    5,
                    (i) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mq.width * .01),
                        child: Icon(
                            i < 3
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            size: 32,
                            color: i < 3 ? Colors.amber : Colors.black)))
              ])),
          SizedBox(height: mq.height * .02),

          //
          const Text('Do your want to Exit?',
              style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600)),
          SizedBox(height: mq.height * .04),

          //
          Row(children: [
            // cancel btn
            Expanded(
                child: CustomBtn(
                    onTap: Get.back,
                    text: 'Cancel',
                    whiteBtn: true,
                    fontSize: 15,
                    hPadding: mq.width * .08,
                    vPadding: mq.width * .016)),
            SizedBox(width: mq.width * .02),

            //
            Expanded(
                child: CustomBtn(
                    onTap: SystemNavigator.pop,
                    text: 'Yes',
                    fontSize: 15,
                    hPadding: mq.width * .1,
                    vPadding: mq.height * .01))
          ])
        ])));
  }
}
