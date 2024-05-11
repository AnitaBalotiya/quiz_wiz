import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../services/firebase/auth/phone_auth.dart';
import '../../utils/widgets/back_btn.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/custom_text_field.dart';
import 'auth_controller.dart';

class OtpSCreen extends StatefulWidget {
  const OtpSCreen({super.key});

  @override
  State<OtpSCreen> createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpSCreen> {
  //
  final etOtp = TextEditingController();
  final _c = Get.find<AuthController>();
  Timer? _timer;
  final tick = 30.obs;

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  Future<void> initTimer() async {
    //
    _timer = Timer.periodic(1.seconds, (t) {
      if (tick.value <= 0) {
        _timer?.cancel();
      } else {
        tick.value -= 1;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('OTP Verification'), leading: const BackBtn()),

        //
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .04),
            //
            children: [
              Text(
                  'Please enter the verification code\nsent to your mobile number +${_c.selectedCountry.value.phoneCode} ${_c.user.etMobileNo.text}.',
                  style: const TextStyle(
                      fontSize: 13.5,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600)),

              SizedBox(height: mq.height * .04),

              //
              CustomTextField(etText: etOtp, hintText: 'Enter the OTP'),
              SizedBox(height: mq.width * .04),

              //
              Obx(() => tick.value > 0
                  ? RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Resend OTP in ',
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text:
                                    '00:${tick.value >= 10 ? '${tick.value}' : '0${tick.value}'}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600))
                          ]))
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: mq.width * .32),
                      child: InkWell(
                          onTap: () => PhoneAuth.verifyPhoneNo(_c),

                          //
                          child: const Text('Resend OTP?',
                              textAlign: TextAlign.center,

                              //
                              style: TextStyle(
                                  color: pColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.5,
                                  decoration: TextDecoration.underline,
                                  decorationColor: pColor))))),
              Divider(height: mq.height * .03),

              SizedBox(height: mq.height * .02),
              CustomBtn(
                  onTap: () => PhoneAuth.signInWithCredential(otp: etOtp.text),
                  text: 'Submit')
            ]));
  }
}
