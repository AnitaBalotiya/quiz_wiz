import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserModel {
  final etEmail = TextEditingController();
  final etMobileNo = TextEditingController();
  final etPassword = TextEditingController();
  final etDisplayName = TextEditingController();
  final etProfile = TextEditingController();
  final score = 0.obs;
  UserModel();

  UserModel.fromJson(Map<String, dynamic> json) {
    etDisplayName.text = json['name'] ?? '';
    etEmail.text = json['email'] ?? '';
    etMobileNo.text = json['mobile_no'] ?? '';
    etProfile.text = json['profile'] ?? '';
    etPassword.text = json['password'] ?? '';
    score.value = int.tryParse(json['score']) ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = etDisplayName.text;
    data['email'] = etEmail.text;
    data['password'] = etPassword.text;
    data['profile'] = etProfile.text;
    data['mobile_no'] = etMobileNo.text;
    data['score'] = score.value;
    return data;
  }
}
