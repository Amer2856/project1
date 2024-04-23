import 'package:project_one/packages.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => SignupState();
}

class SignupState extends State<SignUpPage> {
  bool pass = true;

  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formstate,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Image.asset(
                              "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Creat New Account",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "it is empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "it is empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email_outlined),
                              labelText: "Emial",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "it is empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone),
                              labelText: "Phone",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "it is empty";
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
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          elevation: 10,
                          color: Colors.blue,
                          onPressed: () {
                            if (formstate.currentState!.validate()) {}
                          },
                          child: const Text(
                            "REJESTER",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
