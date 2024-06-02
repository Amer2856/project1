import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
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
                    this.email = email;
                    return null;
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: "email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
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
  final void Function(String) onCompleted; // Callback for completed code
  final int length; // Number of digits in the code
  final bool autoFocus; // Whether to focus on the first field automatically

  const VerificationCodeInput({
    required this.onCompleted,
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
                  },
                  onEditing: (c) {}),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {},
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
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(right: 80, left: 10),
                child: TextFormField(
                  onChanged: (value) {
                    passConfirm = value;
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
                        icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility),
                      ),
                      labelText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 80, left: 10),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return "Please enter a password";
                    } else {
                      password = pass;
                      if (pass != passConfirm) {
                        return 'there is no Match!';
                      } else
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
                        icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility),
                      ),
                      labelText: "Confirm password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 190, bottom: 30),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if (form.currentState!.validate()) {
                      // check the login information
                      // get to the home page
                      // Get.offAll(() => const HomePage());
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 60,
                    width: 100,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
