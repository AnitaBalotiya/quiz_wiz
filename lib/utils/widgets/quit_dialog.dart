import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../modules/questions/questions_controller.dart';
import 'custom_btn.dart';

class QuitDialog {
  static void onTap(QuestionsController c) {
    Get.dialog(AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,

        //
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          const Text('Quit',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
          SizedBox(height: mq.height * .02),

          //
          const Text('Do your really want to quit?',
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
                    onTap: c.updateScore,
                    text: 'Yes',
                    fontSize: 15,
                    hPadding: mq.width * .1,
                    vPadding: mq.height * .01))
          ])
        ])));
  }
}
