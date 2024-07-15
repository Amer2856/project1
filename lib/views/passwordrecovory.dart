<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:project_one/controllers/singup_controlar.dart';
=======
>>>>>>> 97f72e42bb6de082c04d6f11cdc1b79249c6cc38
import 'package:project_one/controllers/verification.dart';
import '../packages.dart';

class Recovory extends StatefulWidget {
  const Recovory({super.key});

  @override
  State<Recovory> createState() => RecovoryState();
}

class RecovoryState extends State<Recovory> {
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const Icon(
              Icons.lock_reset,
              size: 165,
              color: Colors.deepOrangeAccent,
            ),
            const SizedBox(
              height: 20,
            ),
<<<<<<< HEAD
            Emailverify().v.value,
            GetBuilder<SingupControlar>(
                init: SingupControlar(),
                builder: (controlar) => Center(
                        child: Text(
                      controlar.text,
                      style: const TextStyle(
                          color: Colors.deepOrangeAccent, fontSize: 12),
                    )))
=======
            Obx(() => Emailverify().v.value),
            const Center(
                child: Text(
              "To recover your password, Please enter your email address.",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12),
            ))
>>>>>>> 97f72e42bb6de082c04d6f11cdc1b79249c6cc38
          ],
        ),
      ),
    );
  }
}
