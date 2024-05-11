import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_wiz/helper/global.dart';

import '../../helper/my_dialogs.dart';
import '../../helper/pref.dart';
import '../../services/firebase/data/get_data.dart';
import 'auth.dart';

class AuthController extends GetxController {
  UserModel user = UserModel();
  final etConfirmPw = TextEditingController();
  final confirmObscure = true.obs;
  final obscure = true.obs;
  String errMsg = 'Fields are mandatory';
  final isDataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  //
  final selectedCountry = Country(
          phoneCode: '91',
          countryCode: 'IN',
          e164Sc: 91,
          geographic: true,
          level: 1,
          name: 'India',
          example: '',
          displayName: 'India (IN)',
          displayNameNoCountryCode: 'India',
          e164Key: '91')
      .obs;

  Future<void> getUser() async {
    uid = Pref.userId;
    if (uid != null) {
      final data = await GetData.getDoc(collectName: 'users', docId: uid ?? '');

      if (data != null) {
        user = UserModel.fromJson(data);
        isDataLoaded.value = true;
      }
    }
  }

  bool validEmail({bool signin = false}) {
    final email = user.etEmail.value.text;
    final password = user.etPassword.value.text;
    final confirmPw = etConfirmPw.value.text;

    if (!signin) {
      // Check if any field is empty
      if (email.isEmpty || password.isEmpty || confirmPw.isEmpty) {
        MyDialogs.error(msg: 'All fields are mandatory.');
        return false;
      }

      // Check if password matches confirmation
      if (password != confirmPw) {
        MyDialogs.error(msg: 'Password mismatch.');
        return false;
      }
    } else {
      // Check if any field is empty
      if (email.isEmpty || password.isEmpty) {
        MyDialogs.error(msg: 'All fields are mandatory.');
        return false;
      }
    }

    // Check if email format is valid
    if (!email.isEmail) {
      MyDialogs.error(msg: 'Please check your email.');
      return false;
    }

    return true;
  }
}
