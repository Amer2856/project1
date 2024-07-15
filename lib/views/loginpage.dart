import 'package:project_one/controllers/authentication.dart';
import 'package:project_one/controllers/loginpage_controlar.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/widgets/person.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool _obscure = true;
  String? email;
  String? password;
  GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: form,
          child: Column(
            children: [
              person(Colors.deepOrangeAccent),
              Card(
                margin: const EdgeInsets.only(top: 10, right: 25, left: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                        padding: const EdgeInsets.only(right: 80, left: 10),
                        // This is the email input field
                        child: GetBuilder<LoginpageControlar>(
                          init: LoginpageControlar(),
                          builder: (controlar) => TextFormField(
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
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80, left: 10),
                      child: GetBuilder(
                        init: LoginpageControlar(),
                        builder: (controlar) => TextFormField(
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
                              labelText: "password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
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
                              GetBuilder(
                                init: LoginpageControlar(),
                                builder: (controlar) => TextButton(
                                  style: const ButtonStyle(
                                      splashFactory: NoSplash.splashFactory),
                                  onPressed: () {
                                    Get.to(() => const Recovory());
                                  },
                                  child: const Text("Forgot Password?",
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14)),
                                ),
                              ),
<<<<<<< HEAD

                              //Signup Button
                              GetBuilder(
                                  init: LoginpageControlar(),
                                  builder: (controlar) => TextButton(
                                      onPressed: () {
                                        Get.to(const Signup());
                                      },
                                      child: const Text(
                                        "Don't have an account!",
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11.5),
                                      )))
=======
                              // Signup Button
                              TextButton(
                                  onPressed: () {
                                    Get.to(const Signup());
                                  },
                                  child: const Text(
                                    "Don't have an account!",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.5),
                                  ))
>>>>>>> 97f72e42bb6de082c04d6f11cdc1b79249c6cc38
                            ],
                          ),
                        ),
                        // Login Button
                        GetBuilder(
                          init: LoginpageControlar(),
                          builder: (controlar) => InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              if (form.currentState!.validate()) {
                                // check the login information
                                Login(email!, password!);
                                // get to the home page
                                Get.offAll(() => const HomePage());
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              height: 60,
                              width: 100,
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
