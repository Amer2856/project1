import 'package:project_one/controllers/verification.dart';
import 'package:project_one/widgets/person.dart';
import '../packages.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  final Emailverify controller = Get.put(Emailverify());
  String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                person(Colors.deepOrangeAccent),
                Positioned(
                    top: context.height / 15,
                    right: context.width / 2.5,
                    child: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                    ))
              ],
            ),
            Obx(() => controller.v.value),
            //here we put the card
            const Center(
                child: Text(
              "Please enter your email address.",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 12),
            ))
          ],
        ),
      ),
    );
  }
}
