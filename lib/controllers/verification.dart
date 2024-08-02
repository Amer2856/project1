import 'package:project_one/packages.dart';
import 'package:project_one/widgets/emailVerify.dart';

class Emailverify extends GetxController {
  var t = "Please enter your email address.".obs;
  var r = "To recover your password, Please enter your email address.".obs;
  var v = (const EmailInput() as Widget).obs;
  void change() {
    if (v.value is EmailInput) {
      v.value = const VerificationCodeInput() as Widget;
      r.value = t.value =
          "Please checkout your Email inbox for the verification code.";
    } else if (v.value is VerificationCodeInput) {
      v.value = const PasswordInput() as Widget;
      r.value = t.value = "Please enter your new password.";
    }
  }
}
