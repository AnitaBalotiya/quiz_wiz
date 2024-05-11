import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/global.dart';
import '../../../services/firebase/auth/email_auth.dart';
import '../../../utils/constants/str_const.dart';
import '../../../utils/widgets/back_btn.dart';
import '../../../utils/widgets/custom_btn.dart';
import '../../../utils/widgets/custom_text_field.dart';
import '../../../utils/widgets/google_fb.dart';
import '../../../utils/widgets/or_with_divider.dart';
import '../../../utils/widgets/pw_eye_icons.dart';
import '../auth.dart';
import '../auth_controller.dart';
import 'forgot_pw_screen.dart';

class EmailSigninScreen extends StatefulWidget {
  final bool authScreen;
  const EmailSigninScreen({super.key, this.authScreen = false});

  @override
  State<EmailSigninScreen> createState() => _UserSignInState();
}

class _UserSignInState extends State<EmailSigninScreen> {
  final _c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    _c.user = UserModel();

    return Scaffold(
        //
        appBar: AppBar(title: const Text('Sign In'), leading: const BackBtn()),

        //
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .02),
            //
            children: [
              CustomTextField(
                  etText: _c.user.etEmail,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email'),

              //
              SizedBox(height: mq.height * .03),

              //
              Obx(() => CustomTextField(
                  etText: _c.user.etPassword,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter Password',
                  obscureText: _c.obscure.value,

                  //
                  suffixIcon: PwEyeIcon(
                      obscure: _c.obscure.value,
                      onTap: () => _c.obscure.value = !_c.obscure.value))),

              //
              Padding(
                  padding:
                      EdgeInsets.only(left: mq.width * .6, top: mq.width * .01),
                  child: InkWell(
                      onTap: () => Get.to(() => const ForgotPwScreen()),
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)))),

              //
              SizedBox(height: mq.height * .03),
              Divider(height: mq.height * .06),

              //
              CustomBtn(
                  onTap: () {
                    if (_c.validEmail(signin: true)) {
                      EmailAuth.signInWithEmail(userModel: _c.user);
                    }
                  },
                  text: 'Continue'),

              // for giving some space
              SizedBox(height: mq.height * .01),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Don\'t have an account?  ',
                    textAlign: TextAlign.center),

                //
                InkWell(
                    onTap: () => Get.back(),

                    //
                    child: const Text('Sign Up', style: underlineTextStyle))
              ]),

              //
              SizedBox(height: mq.height * .06),
              const OrWithDivider(),

              //
              SizedBox(height: mq.height * .03),
              GoogleFb(
                  img: StrConst.google,
                  title: 'Continue With Google',
                  // onTap: () => GoogleAuth.signInWithGoogle()
                  onTap: () {}),

              //
              SizedBox(height: mq.height * .02),
              GoogleFb(
                  img: StrConst.phone,
                  title: 'Continue With Phone Number',
                  onTap: () {
                    if (widget.authScreen) {
                      Get.back();
                    } else {
                      Get.back();
                      Get.back();
                    }
                  }),

              //
              SizedBox(height: mq.height * .02),

              //
              // const CustomTextSpan()
            ]));
  }
}
