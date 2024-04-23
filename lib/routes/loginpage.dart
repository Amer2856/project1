import 'package:project_one/packages.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _coifornpassword = TextEditingController();
  bool pass = true;
  bool pass2 = true;
  Icon ic = const Icon(Icons.remove_red_eye_outlined);
  GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Image.asset(
                            "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "T O U R I S M ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(height: 80),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "it is empety";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            labelText: "email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please entter password";
                          }
                          return null;
                        },
                        obscureText: pass,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pass = !pass;
                                });
                              },
                              child: Icon(pass
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            labelText: "password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _coifornpassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter re-passoord ";
                          }
                          if (_password.text != _coifornpassword.text) {
                            return "password do not match";
                          }
                          return null;
                        },
                        obscureText: pass2,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pass2 = !pass2;
                                });
                              },
                              child: Icon(pass2
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            labelText: "confirm password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            elevation: 10,
                            color: Colors.blue,
                            onPressed: () {
                              if (form.currentState!.validate()) {}
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          MaterialButton(
                            elevation: 10,
                            color: Colors.blue,
                            onPressed: () {},
                            child: const Text(
                              "REJESTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
