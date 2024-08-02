import 'package:project_one/controllers/verification.dart';
import 'package:project_one/widgets/person.dart';
import '../packages.dart';

String? email;

class Signup extends StatelessWidget {
  // final Emailverify controller = Get.put(Emailverify());
  Signup({super.key});

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
            GetX<Emailverify>(
                init: Emailverify(),
                builder: (controller) => controller.v.value),
            //here we put the card
            Center(child: GetX<Emailverify>(builder: (controller) {
              return Text(
                controller.t.value,
                style: const TextStyle(
                    color: Colors.deepOrangeAccent, fontSize: 12),
              );
            })),
          ],
        ),
      ),
    );
  }
}
