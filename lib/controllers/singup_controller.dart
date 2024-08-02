import 'package:project_one/packages.dart';

class SingupController extends GetxController {
  String? password;
  var value;
  pass() {
    password = value;
    update();
  }
}
