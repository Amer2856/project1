import 'package:project_one/controllers/verification.dart';
import '../packages.dart';

class Recovory extends StatelessWidget {
  final Emailverify controller = Get.put(Emailverify());
  Recovory({super.key});

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
            Obx(() => controller.v.value),
            Center(child: GetX<Emailverify>(builder: (controller) {
              return Text(
                controller.r.value,
                style: const TextStyle(
                    color: Colors.deepOrangeAccent, fontSize: 12),
              );
            }))
          ],
        ),
      ),
    );
  }
}
