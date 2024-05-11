import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../helper/global.dart';
import '../../../services/firebase/auth/email_auth.dart';
import '../../../utils/widgets/back_btn.dart';
import '../../../utils/widgets/custom_btn.dart';
import '../../../utils/widgets/custom_text_field.dart';

class ForgotPwScreen extends StatefulWidget {
  const ForgotPwScreen({super.key});

  @override
  State<ForgotPwScreen> createState() => _ForgotPwScreenState();
}

class _ForgotPwScreenState extends State<ForgotPwScreen> {
  final etText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //
        appBar: AppBar(
            title: const Text('Account Recovery'), leading: const BackBtn()),

        //
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .04),

            //
            children: [
              CustomTextField(etText: etText, hintText: 'Email'),
              SizedBox(height: mq.height * .02),
              Divider(height: mq.height * .04),

              //
              CustomBtn(
                  onTap: () {
                    log('text ---- ${etText.text}');
                    EmailAuth.forgotPassword(email: etText.text);
                  },
                  text: 'Continue')
            ]));
  }
}
