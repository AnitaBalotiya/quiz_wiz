import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../helper/my_dialogs.dart';
import '../../../helper/pref.dart';
import '../../../modules/auth/auth.dart';
import '../../../modules/home/home_screen.dart';

class EmailAuth {
  static final _firebaseAuth = FirebaseAuth.instance;

  static Future<void> emailAuth({required UserModel userModel}) async {
    try {
      MyDialogs.showProgressBar();
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.etEmail.text, password: userModel.etPassword.text);
      Get.back();

      if (credential.user != null) {
        Pref.userId = credential.user?.uid;
        Get.offAll(() => const HomeScreen());
      }

      //
    } on FirebaseAuthException catch (e) {
      Get.back();

      //
      if (e.code == 'weak-password') {
        MyDialogs.error(msg: 'The password provided is too weak.');
      }
      if (e.code == 'email-already-in-use') {
        MyDialogs.error(msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Get.back();
      log(e.toString());
      MyDialogs.error(msg: 'Something went wrong.');
    }
  }

  static Future<void> signInWithEmail({required UserModel userModel}) async {
    try {
      MyDialogs.showProgressBar();
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: userModel.etEmail.text, password: userModel.etPassword.text);

      if (credential.user != null) {
        Pref.userId = credential.user?.uid;
        Get.offAll(() => const HomeScreen());
      }

      //
    } on FirebaseAuthException catch (e) {
      Get.back();
      log(e.toString());
      //
      if (e.code == 'user-not-found') {
        MyDialogs.error(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        MyDialogs.error(msg: 'Wrong password provided for that user.');
      }

      if (e.code == 'invalid-credential') {
        MyDialogs.error(msg: 'You\'ve provided invalid credentials.');
      }
    } catch (e) {
      Get.back();
      log(e.toString());
      MyDialogs.error(msg: 'Something went wrong.');
    }
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
    Pref.skipIntro = false;
    Pref.userId = null;
  }

  static Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      Get.back();
      MyDialogs.info(msg: 'Please check your email address.');
    } on FirebaseAuthException catch (e) {
      log(e.toString());

      if (e.code == 'invalid-email') {
        MyDialogs.error(msg: 'Invalid Email Address.');
      } else {
        MyDialogs.error(msg: 'Something went wrong.');
      }
    }
  }
}
