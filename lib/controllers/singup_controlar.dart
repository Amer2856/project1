import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';

class SingupControlar extends GetxController {
  String lable = "Password";
  String lable2 = "Confirm password";
  String login = "Login";
  String? passConfirm;
  String lable3 = "email";
  String submit = "submit";
  String text = "To recover your password, Please enter your email address.";
  var value;
  pass() {
    passConfirm = value;
    update();
  }
}
