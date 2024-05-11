import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_wiz/helper/global.dart';

import '../../../helper/my_dialogs.dart';
import '../../../helper/pref.dart';
import '../../../modules/auth/auth_controller.dart';
import '../../../modules/auth/otp_screen.dart';
import '../../../modules/home/home_screen.dart';

class PhoneAuth {
  static final firebaseAuth = FirebaseAuth.instance;

  static String verifyId = '';
  static int? _resendToken;

  //
  static void verifyPhoneNo(AuthController c) async {
    final phoneNo = c.user.etMobileNo.text;
    if (phoneNo.isValid) {
      try {
        MyDialogs.showProgressBar();
        final phoneNoWithCode = '+${c.selectedCountry.value.phoneCode}$phoneNo';

        log('phoneNoWithCode ----- $phoneNoWithCode, verifyId ------ $verifyId, resendToken ----- $_resendToken');
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNoWithCode,
            timeout: const Duration(seconds: 30),
            forceResendingToken: _resendToken,

            //
            verificationCompleted: (PhoneAuthCredential credential) async {
              // ANDROID ONLY!

              // Sign the user in (or link) with the auto-generated credential
              await firebaseAuth.signInWithCredential(credential);
            },

            //
            verificationFailed: (FirebaseAuthException e) {
              Get.back();
              if (e.code == 'invalid-phone-number') {
                MyDialogs.error(msg: 'You\'ve provided wrong number.');
                log(e.toString());
              }
            },
            codeSent: (String verificationId, int? forceResendingToken) async {
              Get.back();
              _resendToken = forceResendingToken;
              verifyId = verificationId;
              Get.to(() => const OtpSCreen());
            },
            codeAutoRetrievalTimeout: (String verificationId) {});
      } catch (e) {
        Get.back();
        MyDialogs.error(
            msg: 'Something went wrong.\nPease try again after sometimes.');
        log(e.toString());
      }
    } else {
      MyDialogs.error(msg: 'Please provide the mobile number.');
    }
  }

  static Future<void> signInWithCredential({required String otp}) async {
    try {
      MyDialogs.showProgressBar();

      // Sign the user in (or link) with the credential
      final credentials = await firebaseAuth.signInWithCredential(

          // Create a PhoneAuthCredential with the code
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp));

      if (credentials.user != null) {
        Pref.userId = credentials.user?.uid;
        Get.offAll(() => const HomeScreen());
      }
      Get.back();
    } catch (e) {
      Get.back();
      MyDialogs.error(msg: 'Something went wrong.');
      log('Error: $e');
    }
  }

  static Future<void> signOut() async {
    await firebaseAuth.signOut();
    Pref.skipIntro = false;
    Pref.userId = null;
  }
}
