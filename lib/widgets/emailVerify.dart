import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:project_one/controllers/singup_controller.dart';
import 'package:project_one/controllers/verification.dart';
import '../packages.dart';

class EmailInput extends StatefulWidget {
  const EmailInput({super.key});

  @override
  State<EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  final Emailverify controller = Get.put(Emailverify());
  String? email;
  GlobalKey<FormState> emailinput = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
                key: emailinput,
                child: GetBuilder<SingupController>(
                  init: SingupController(),
                  builder: (controller) => TextFormField(
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
                        this.email = email;
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                )),
          ),
          ElevatedButton(
              onPressed: () {
                if (emailinput.currentState!.validate()) {
                  controller.change();
                }
              },
              child: const Text("submit")),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class VerificationCodeInput extends StatefulWidget {
  final int length; // Number of digits in the code
  final bool autoFocus; // Whether to focus on the first field automatically

  const VerificationCodeInput({
    this.length = 6,
    this.autoFocus = true,
  });

  @override
  State<VerificationCodeInput> createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final Emailverify controller = Get.put(Emailverify());
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              VerificationCode(
                  length: 6,
                  itemSize: 40,
                  textStyle: const TextStyle(fontSize: 18),
                  margin: const EdgeInsets.all(2),
                  underlineColor: Colors.deepOrangeAccent,
                  underlineWidth: 2,
                  digitsOnly: true,
                  fullBorder: true,
                  onCompleted: (code) {
                    print(code);
                    controller.change();
                  },
                  onEditing: (c) {}),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text('code sent'),
                    ),
                  );
                },
                child: const Text(
                  "Resend Code?",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscure = true;
  String? password;
  String? passConfirm;

  GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                GetBuilder<SingupController>(
                  init: SingupController(),
                  builder: (controller) => TextFormField(
                    onChanged: (value) {
                      controller.pass();
                      // passConfirm = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    validator: (pass) {
                      if (pass!.isEmpty) {
                        return "Please enter a password";
                      } else {
                        password = pass;
                        return null;
                      }
                    },
                    obscureText: _obscure,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                          icon: Icon(_obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<SingupController>(
                  init: SingupController(),
                  builder: (controller) => TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: (pass) {
                      if (pass!.isEmpty) {
                        return "Please enter a password";
                      } else {
                        if (pass != password) {
                          return 'there is no Match!';
                        }
                      }
                      return null;
                    },
                    obscureText: _obscure,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                          icon: Icon(_obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        labelText: "Confirm password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                MaterialButton(
                  height: 60,
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    if (form.currentState!.validate()) {
                      Get.offAll(HomePage());
                    }
                  },
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }
}
