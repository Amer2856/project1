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
            Obx(() => Emailverify().v.value),
            const Center(
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
