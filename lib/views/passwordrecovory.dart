import 'package:flutter/material.dart';
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
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Icon(
              Icons.lock_reset,
              size: 165,
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(
              height: 20,
            ),
            Emailverify().v.value,
            Center(
                child: Text(
              "To recover your password, Please enter your email address.",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12),
            ))
          ],
        ),
      ),
    );
  }
}
