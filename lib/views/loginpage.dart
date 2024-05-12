import 'package:project_one/packages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool _obscure = true;
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
              // the logo of a person
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(65, 25, 65, 50),
                  padding: const EdgeInsets.all(30),
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(15, 10),
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        height: 25,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                // This is the email input field
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: "email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a password";
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
                        icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility),
                      ),
                      labelText: "password",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)))),
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
                              splashFactory: NoSplash.splashFactory),
                          onPressed: () {
                            Get.to(() => const FormPage());
                          },
                          child: const Text("Forgot Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14)),
                        ),

                        // Signup Button
                        TextButton(
                            onPressed: () {
                              Get.to(SignUpPage());
                            },
                            child: const Text(
                              "Don't have an Account!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 11.5),
                            ))
                      ],
                    ),
                  ),
                  // Login Button
                  InkWell(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    onTap: () {
                      Get.offAll(() => const HomePage());
                      // if (form.currentState!.validate()) {}
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      height: 70,
                      width: 100,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
