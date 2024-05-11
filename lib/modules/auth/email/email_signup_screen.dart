import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/global.dart';
import '../../../services/firebase/auth/email_auth.dart';
import '../../../services/firebase/auth/google_auth.dart';
import '../../../utils/constants/str_const.dart';
import '../../../utils/widgets/back_btn.dart';
import '../../../utils/widgets/custom_btn.dart';
import '../../../utils/widgets/custom_text_field.dart';
import '../../../utils/widgets/google_fb.dart';
import '../../../utils/widgets/or_with_divider.dart';
import '../../../utils/widgets/pw_eye_icons.dart';
import '../auth.dart';
import '../auth_controller.dart';
import 'email_signin_screen.dart';

class EmailAuthScreen extends StatelessWidget {
  EmailAuthScreen({super.key});

  final _c = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    _c.user = UserModel();

    //
    return Scaffold(

        //
        appBar: AppBar(title: const Text('Sign Up'), leading: const BackBtn()),

        //
        body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .02),

            //
            children: [
              //
              CustomTextField(
                  etText: _c.user.etEmail,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email'),

              // for giving some space
              SizedBox(height: mq.height * .03),

              //
              Obx(() => CustomTextField(
                  etText: _c.user.etPassword,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Password',
                  obscureText: _c.obscure.value,

                  //
                  suffixIcon: PwEyeIcon(
                      onTap: () => _c.obscure.value = !_c.obscure.value,
                      obscure: _c.obscure.value))),

              // for giving some space
              SizedBox(height: mq.height * .03),
              //
              Obx(() => CustomTextField(
                  etText: _c.etConfirmPw,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Confirm Password',
                  obscureText: _c.confirmObscure.value,

                  //
                  suffixIcon: PwEyeIcon(
                      obscure: _c.confirmObscure.value,
                      onTap: () =>
                          _c.confirmObscure.value = !_c.confirmObscure.value))),

              // for giving some space
              SizedBox(height: mq.height * .03),

              //
              Divider(height: mq.height * .06),
              CustomBtn(
                  onTap: () {
                    if (_c.validEmail()) {
                      EmailAuth.emailAuth(userModel: _c.user);
                    }
                  },
                  text: 'Continue'),
              SizedBox(height: mq.width * .01),

              //
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Already have an account? ',
                    textAlign: TextAlign.center),

                //
                InkWell(
                    onTap: () => Get.to(() => const EmailSigninScreen()),

                    //
                    child: const Text('Sign In',

                        //
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: pColor,
                            decorationColor: pColor,
                            fontWeight: FontWeight.bold)))
              ]),

              // for giving some space
              SizedBox(height: mq.height * .08), //
              const OrWithDivider(),
              SizedBox(height: mq.height * .03),

              //
              GoogleFb(
                  onTap: () => Get.back(),
                  google: false,
                  img: StrConst.phone,
                  title: 'Continue With Phone Number'),
              SizedBox(height: mq.height * .02),

              //
              GoogleFb(
                  onTap: () => GoogleAuth.signInWithGoogle(_c.user),
                  img: StrConst.google,
                  title: 'Continue With Google')
            ]));
  }
}
