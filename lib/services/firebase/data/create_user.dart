import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../helper/global.dart';
import '../../../helper/my_dialogs.dart';
import '../../../modules/auth/auth_controller.dart';

class CreateUser {
  static final firestore = FirebaseFirestore.instance;

  static final authC = Get.find<AuthController>();

  // To check if user exist or not
  static Future<bool> userExists() async =>
      (await CreateUser.firestore.collection('users').doc(uid).get()).exists;

  // creating user to store their details
  static Future<void> createUser() async {
    try {
      if (uid != null) {
        final exist = await userExists();
        dev.log('exist   ---- $exist, userJson --- ${authC.user.toJson()}');

        if (!exist) {
          await firestore.collection('users').doc(uid).set(authC.user.toJson());
        }
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }

  static Future<void> toUpdateField(
      {required String key, required String value}) async {
    try {
      MyDialogs.showProgressBar();
      final exist = await userExists();

      //
      if (exist) {
        final doc = firestore.collection('users').doc(uid);
        await doc.update({key: value}).then((v) async => Get.back());
      }
    } catch (e) {
      Get.back();
      dev.log(e.toString());
    }
  }
}
