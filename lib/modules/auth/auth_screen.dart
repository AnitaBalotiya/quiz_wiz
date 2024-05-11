import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helper/global.dart';
import '../../services/firebase/auth/google_auth.dart';
import '../../services/firebase/auth/phone_auth.dart';
import '../../utils/constants/str_const.dart';
import '../../utils/widgets/country_picker.dart';
import '../../utils/widgets/custom_btn.dart';
import '../../utils/widgets/custom_text_field.dart';
import '../../utils/widgets/google_fb.dart';
import '../../utils/widgets/logo_img.dart';
import '../../utils/widgets/or_with_divider.dart';
import '../../utils/widgets/prefix_country_icon.dart';
import 'auth_controller.dart';
import 'email/email_signin_screen.dart';
import 'email/email_signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _c = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();

    //enter full-screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pColor,
        resizeToAvoidBottomInset: false,

        //
        body: Column(children: [
          const Spacer(),
          const LogoImg(),
          const Spacer(),

          //
          Container(
              height: mq.height * .6,
              width: mq.width,

              //
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),

              //
              child: ListView(
                  physics: const BouncingScrollPhysics(),

                  //
                  padding: EdgeInsets.only(
                      left: mq.width * .05,
                      right: mq.width * .05,
                      bottom: mq.height * .04),

                  //
                  children: [
                    //
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mq.width * .35,
                            vertical: mq.height * .02),
                        child: const Divider(thickness: 2.5, color: pColor)),
                    //
                    const Text('Join Us Now',
                        style: TextStyle(
                            fontSize: 16.5, fontWeight: FontWeight.w600)),

                    // for giving some space
                    SizedBox(height: mq.height * .02),

                    // select country
                    CustomTextField(
                        etText: _c.user.etMobileNo,
                        textInputType: TextInputType.phone,
                        textInputFormatter: inputFormatter,
                        //
                        prefixIcon: InkWell(
                            onTap: () => CountryPicker.showPicker(context,
                                country: _c.selectedCountry),

                            //
                            child: Obx(() => PrefixCountryIcon(
                                selectedCountry: _c.selectedCountry.value))),
                        //
                        hintText: 'Mobile Number'),

                    // for giving some space
                    SizedBox(height: mq.height * .04),

                    //
                    CustomBtn(
                        onTap: () => PhoneAuth.verifyPhoneNo(_c),
                        text: 'Continue'),

                    // for giving some space
                    SizedBox(height: mq.height * .01),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('Already have an account?  ',
                          textAlign: TextAlign.center),

                      //
                      InkWell(
                          onTap: () => Get.to(
                              () => const EmailSigninScreen(authScreen: true)),

                          //
                          child:
                              const Text('Sign In', style: underlineTextStyle))
                    ]),

                    // for giving some space
                    SizedBox(height: mq.height * .02),

                    //
                    const OrWithDivider(),

                    // for giving some space
                    SizedBox(height: mq.height * .04),

                    //
                    GoogleFb(
                        onTap: () => Get.to(() => EmailAuthScreen()),
                        google: false,
                        img: StrConst.email,
                        title: 'Continue With Email'),

                    // for giving some space
                    SizedBox(height: mq.height * .03),

                    //
                    GoogleFb(
                        onTap: () => GoogleAuth.signInWithGoogle(_c.user),
                        img: StrConst.google,
                        title: 'Continue With Google'),

                    // for giving some space
                    SizedBox(height: mq.height * .02),

                    //
                    // const CustomTextSpan()
                  ]))
        ]));
  }
}
