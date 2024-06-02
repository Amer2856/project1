import 'dart:ffi';

import 'package:project_one/packages.dart';
import 'package:project_one/widgets/emailVerify.dart';

class Emailverify extends GetxController {
  var v = (EmailInput() as Widget).obs;
  void change() {
    if (v.value is EmailInput) {
      v.value = VerificationCodeInput(
        onCompleted: (code) {},
      ) as Widget;
    } else {
      v.value = const EmailInput();
    }
  }
  // bool v = false;
  // void sw() {
  //   v = !v;
  //   update();
  //}
}
