import 'package:project_one/core/api/end_ponits.dart';
import 'package:project_one/core/errors/exceptions.dart';
import 'package:project_one/packages.dart';
import 'package:get/get.dart';

class LoginpageController extends GetxController {
  final ApiConsumer api;
  bool obscure = true;
  int? state;
  String? email;
  String? password;

  LoginpageController(this.api);

  void obscurechange() {
    obscure = !obscure;
    update();
  }

  void emailinput(String s) {
    email = s;
    update();
  }

  void passinput(String p) {
    password = p;
    update();
  }

  signIn() async {
    try {
      state = 0;
      update;
      final response = await api.post(EndPoint.signIn,
          data: {ApiKey.email: email, ApiKey.password: password});
      state = response.statuscode;
      update;
    } on ServerException catch (e) {
      state = e.errModel.status;
      update;
    }
  }
}
