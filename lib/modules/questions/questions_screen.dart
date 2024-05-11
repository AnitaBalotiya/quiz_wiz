import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/quit_dialog.dart';
import 'questions_controller.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _c = Get.find<QuestionsController>();

  @override
  void initState() {
    super.initState();
    //enter full-screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v) => QuitDialog.onTap(_c),
      //
      child: Scaffold(
          //
          body: SafeArea(

              //
              child: ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .04, vertical: mq.height * .02),

                  //
                  children: [
            //
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //
              IconButton(
                  onPressed: () => QuitDialog.onTap(_c),

                  //
                  icon: const CircleAvatar(
                      radius: 16.5,
                      backgroundColor: sColor,

                      //
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: pColor,
                          child: Icon(CupertinoIcons.xmark,
                              size: 18, color: Colors.white)))),
              //
              Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: mq.width * .05, vertical: mq.width * .01),

                  //
                  decoration: BoxDecoration(
                      color: pColor,
                      borderRadius: borderRadius(18),
                      border: Border.all(color: sColor, width: 1.5)),
                  //
                  child: Obx(() => Text('Scores: ${_c.authC.user.score.value}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16))))
            ]),

            //

            Container(
                alignment: Alignment.center,
                height: mq.height * .2,
                margin: EdgeInsets.only(top: mq.height * .08),
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .04, vertical: mq.height * .02),

                //
                decoration: BoxDecoration(
                    color: pColorWithOp20,
                    borderRadius: borderRadius(18),
                    border: Border.all(color: pColor, width: .6)),

                //
                child: Obx(() => Text(_c.showQuest.value.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)))),
            SizedBox(height: mq.height * .08),

            //

            Obx(() => Column(children: [
                  ..._c.showQuest.value.options.map((e) => Padding(
                      padding: EdgeInsets.only(
                          top: mq.height * .02,
                          left: mq.width * .02,
                          right: mq.width * .02),

                      //
                      child: InkWell(
                          onTap: () => _c.selectedAns.value = e,
                          borderRadius: borderRadius(28),

                          //
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: mq.width * .02,
                                  vertical: mq.width * .02),

                              //
                              decoration: BoxDecoration(
                                  color: _c.selectedAns.value == e
                                      ? pColorWithOp20
                                      : Colors.white,
                                  borderRadius: borderRadius(30),
                                  border: Border.all(color: pColor)),

                              //
                              child: Text(e,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)))))),
                ])),

            SizedBox(height: mq.height * .1),
            CustomBtn(onTap: _c.onClickNext, text: 'Next')
          ]))),
    );
  }
}
