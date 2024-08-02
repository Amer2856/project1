import 'package:dio/dio.dart';
import 'package:project_one/controllers/loginpage_controller.dart';
import 'package:project_one/core/api/dio_consumer.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/widgets/person.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            person(Colors.deepOrangeAccent),
            Card(
              margin: const EdgeInsets.only(top: 10, right: 25, left: 25),
              child: GetBuilder<LoginpageController>(
                  init: LoginpageController(DioConsumer(dio: Dio())),
                  builder: (controller) {
                    return Form(
                      key: form,
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 80, left: 10),
                              // This is the email input field
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                validator: (email) {
                                  if (email!.isEmpty) {
                                    return "Please enter an email";
                                  }
                                  // validates if the  of the email is correct
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(email)) {
                                    return "Wrong email pattern";
                                  } else {
                                    controller.email = email;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    labelText: "email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 80, left: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              validator: (pass) {
                                if (pass!.isEmpty) {
                                  return "Please enter a password";
                                } else if (pass.length < 8) {
                                  return "Short Password";
                                } else {
                                  controller.password = pass;
                                  return null;
                                }
                              },
                              obscureText: controller.obscure,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outlined),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.obscurechange();
                                    },
                                    icon: Icon(controller.obscure
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  labelText: "password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              // Forgot_password Button
                              Expanded(
                                child: Column(
                                  children: [
                                    TextButton(
                                      style: const ButtonStyle(
                                          splashFactory:
                                              NoSplash.splashFactory),
                                      onPressed: () {
                                        Get.to(() => Recovory());
                                      },
                                      child: const Text("Forgot Password?",
                                          style: TextStyle(
                                              color: Colors.deepOrangeAccent,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14)),
                                    ),
                                    // Signup Button
                                    TextButton(
                                        onPressed: () {
                                          Get.to(Signup());
                                        },
                                        child: const Text(
                                          "Don't have an account!",
                                          style: TextStyle(
                                              color: Colors.deepOrangeAccent,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 11.5),
                                        ))
                                  ],
                                ),
                              ),
                              // Login Button
                              (controller.state == 0)
                                  ? CircularProgressIndicator()
                                  : MaterialButton(
                                      height: 60,
                                      minWidth: 100,
                                      color: Colors.deepOrangeAccent,
                                      onPressed: () async {
                                        if (form.currentState!.validate()) {
                                          controller.state = 0;
                                          controller.update();
                                          // check the login information
                                          await controller.signIn();
                                          if (controller.state == 200)
                                          // get to the home page
                                          {
                                            Get.offAll(() => const HomePage());
                                          } else if (controller.state == 400) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "No internet connection")));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Wrong email or password")));
                                          }
                                        }
                                      },
                                      shape: ContinuousRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
