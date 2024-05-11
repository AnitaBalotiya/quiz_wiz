import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../helper/global.dart';
import '../../helper/pref.dart';
import '../../services/firebase/data/create_user.dart';
import '../../utils/constants/str_const.dart';
import '../../utils/widgets/exit_dialog.dart';
import '../auth/auth_controller.dart';
import '../questions/questions_controller.dart';
import '../questions/questions_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authC = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();

    CreateUser.createUser();
    uid = Pref.userId;
    Pref.skipIntro = true;
  }

  final questC = Get.put(QuestionsController());

  @override
  Widget build(BuildContext context) {
    const scoreStyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: pColor);
    //
    return PopScope(
        canPop: false,
        onPopInvoked: (v) => ExitDialog.onTap(),

        //
        child: Scaffold(

            //
            appBar: AppBar(title: const Text(appName), actions: [
              IconButton(
                  onPressed: () => Share.share(
                      'Enhance your cognitive skills with this amazing app – download now!😃\n$appName: https://play.google.com/store/apps/details?id=$packageName'),
                  icon: const Icon(Icons.share_outlined))
            ]),

            //
            body: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: mq.width * .04, vertical: mq.height * .02),

                //
                children: [
                  //
                  const Divider(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      //
                      children: [
                        const Text('Total Score', style: scoreStyle),
                        Obx(() => Text('${authC.user.score.value}',
                            style: scoreStyle))
                      ]),

                  //
                  const Divider(),
                  SizedBox(height: mq.height * .02),

                  //
                  InkWell(
                      borderRadius: borderRadius(14),
                      onTap: () => Get.to(() => const QuestionScreen()),

                      //
                      child: Card(
                          color: const Color(0Xffe5e5e5),
                          surfaceTintColor: Colors.transparent,
                          elevation: .1,

                          //
                          child: Stack(

                              //

                              children: [
                                //
                                Align(
                                    alignment: Alignment.center,
                                    //
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: mq.height * .01,
                                            left: mq.width * .4),

                                        //
                                        child: Image.asset(StrConst.educational,
                                            height: mq.height * .25,
                                            width: mq.width * .45,
                                            fit: BoxFit.fill))),

                                //
                                Align(
                                    alignment: Alignment.centerLeft,

                                    //
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: mq.width * .04,
                                            top: mq.height * .05),

                                        //
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            //
                                            children: [
                                              const Text('Daily Quiz',
                                                  style: TextStyle(
                                                      color: sColor,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 26)),

                                              //
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: mq.width * .3),

                                                  //
                                                  child: const Text(
                                                      'Let\'s engage in a quiz to enhance your cognitive abilities.',

                                                      //
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: pColor,
                                                          fontSize: 15.5))),

                                              //
                                              Container(
                                                  width: mq.width * .35,

                                                  //
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          mq.width * .03,
                                                      vertical: mq.width * .01),
                                                  margin: EdgeInsets.only(
                                                      top: mq.height * .02),

                                                  //
                                                  decoration: BoxDecoration(
                                                      color: pColor
                                                          .withOpacity(.3),
                                                      borderRadius:
                                                          borderRadius(20),
                                                      border: Border.all(
                                                          color: pColor)),

                                                  //
                                                  child: const Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,

                                                      //
                                                      children: [
                                                        Text('Start',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    .5,
                                                                fontSize: 18)),

                                                        //
                                                        Icon(
                                                            CupertinoIcons
                                                                .arrow_right,
                                                            color: Colors.white)
                                                      ]))
                                            ])))
                              ])))
                ])));
  }
}
