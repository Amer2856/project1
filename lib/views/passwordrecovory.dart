import 'package:flutter/material.dart';
import 'package:project_one/controllers/singup_controlar.dart';
import 'package:project_one/controllers/verification.dart';
import 'package:project_one/widgets/emailVerify.dart';
import 'package:project_one/widgets/person.dart';

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
            Emailverify().v.value,
            GetBuilder<SingupControlar>(
                init: SingupControlar(),
                builder: (controlar) => Center(
                        child: Text(
                      controlar.text,
                      style: const TextStyle(
                          color: Colors.deepOrangeAccent, fontSize: 12),
                    )))
          ],
        ),
      ),
    );
  }
}
