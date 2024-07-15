<<<<<<< HEAD
import 'package:project_one/controllers/actionbar.dart';
=======
>>>>>>> 97f72e42bb6de082c04d6f11cdc1b79249c6cc38
import 'package:project_one/packages.dart';

class ActionsBar extends StatefulWidget {
  const ActionsBar({super.key});
  @override
  State<ActionsBar> createState() => _ActionsBarState();
}

class _ActionsBarState extends State<ActionsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.width / 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Actions Bar
            Card(
              elevation: 5,
              shadowColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Builder(builder: (context0) {
<<<<<<< HEAD
                return GetBuilder<Actionbarcontrollar>(
                    init: Actionbarcontrollar(),
                    builder: (controlar) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Login Button
                              IconButton(
                                onPressed: () {
                                  Get.to(() => const LoginPage());
                                },
                                icon: const Icon(Icons.login),
                              ),
                              // Search Field
                              const Expanded(child: SearchTextField()),
                              // Sorting button
                              IconButton(
                                icon: Image.asset(
                                  color: Colors.white70,
                                  'images/sorting_icon.png',
                                  scale: 150,
                                ),
                                onPressed: () {
                                  // Sorting Options
                                },
                              ),
                            ]));
=======
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Login Button
                      IconButton(
                        onPressed: () {
                          Get.to(() => const LoginPage());
                        },
                        icon: const Icon(Icons.login),
                      ),
                      // Search Field
                      const Expanded(child: SearchTextField()),
                      // Sorting button
                      IconButton(
                        icon: Image.asset(
                          color: Colors.white70,
                          'images/sorting_icon.png',
                          scale: 150,
                        ),
                        onPressed: () {
                          // Sorting Options
                        },
                      ),
                    ]);
>>>>>>> 97f72e42bb6de082c04d6f11cdc1b79249c6cc38
              }),
            ),
            // Filtering Button
            ElevatedButton(onPressed: () {}, child: const Text("Filtering"))
          ],
        ));
  }
}
