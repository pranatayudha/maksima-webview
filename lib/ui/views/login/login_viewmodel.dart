import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:stacked/stacked.dart';

import '../../../application/mixins/login_mixin.dart';

class LoginViewModel extends FutureViewModel with LoginMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  bool isObscured = true;
  String? version;
  String? buildNumber;

  GlobalKey<FormState> get formKey => _formKey;
  AutovalidateMode get autoValidateMode => _autoValidateMode;

  @override
  Future futureToRun() async => await _getVersion();

  Future _getVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    notifyListeners();
  }

  void savePersonalNumber(String value) => personalNumber = value.trim();

  void savePassword(String value) => password = value.trim();

  void toggleShowPassword() {
    isObscured = !isObscured;
    notifyListeners();
  }

  void validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      login();
    } else {
      _autoValidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }
}
