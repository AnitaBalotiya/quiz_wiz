import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../helper/my_dialogs.dart';
import '../../../helper/pref.dart';
import '../../../modules/auth/auth.dart';
import '../../../modules/home/home_screen.dart';

class GoogleAuth {
  static final google = GoogleSignIn();

  //
  static Future<void> signInWithGoogle(UserModel userModel) async {
    try {
      MyDialogs.showProgressBar();
      final GoogleSignInAccount? googleUser = await google.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      final userCredentials =
          await FirebaseAuth.instance.signInWithCredential(credential);

      //
      final user = userCredentials.user;
      if (user != null) {
        Get.back();
        Pref.userId = user.uid;
        userModel
          ..etProfile.text = user.photoURL ?? ''
          ..etEmail.text = user.email ?? ''
          ..etDisplayName.text = user.displayName ?? '';

        //
        Get.offAll(() => const HomeScreen());
      } else {
        Get.back();
        MyDialogs.error(msg: 'Something went wrong.');
      }
    } catch (e) {
      Get.back();
      log(e.toString());
      MyDialogs.error(msg: 'Something went wrong.');
    }
  }

  static Future<void> signOut() async {
    await google.signOut();
    Pref.skipIntro = false;
    Pref.userId = null;
  }
}
