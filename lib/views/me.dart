import 'package:project_one/controllers/homepagecontroller.dart';
import 'package:project_one/packages.dart';

final Homepagecontroller controller = Get.put(Homepagecontroller());

class Me extends StatelessWidget {
  const Me({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        // profile picture
        CircleAvatar(
          radius: 100,
          backgroundImage: const AssetImage(
              "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
          child: InkWell(
            onTap: () {
              // action for image_picker
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // User name
        TextButton(onPressed: () {}, child: const Text("...")),
        const SizedBox(
          height: 2,
        ),
        // User auth
        TextButton(onPressed: () {}, child: const Text("0987654321")),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width / 20),
            child: Card(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // Settings
                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Colors.deepOrangeAccent,
                      ),
                      title: const Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() =>
                      // theme change button
                      Card(
                          child: ListTile(
                        leading: const Icon(
                          Icons.color_lens_outlined,
                          color: Colors.deepOrangeAccent,
                        ),
                        title: const Text(
                          "Dark Theme",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent),
                        ),
                        trailing: Switch(
                            value: controller.darktheme.value,
                            onChanged: (val) {
                              (val)
                                  ? Get.changeThemeMode(ThemeMode.dark)
                                  : Get.changeThemeMode(ThemeMode.light);
                              controller.darktheme.value = val;
                            }),
                        onTap: () {
                          if (Get.isDarkMode) {
                            Get.changeThemeMode(ThemeMode.light);
                          } else {
                            Get.changeThemeMode(ThemeMode.dark);
                          }
                          controller.darktheme.value =
                              !controller.darktheme.value;
                        },
                      ))),
                  const SizedBox(
                    height: 20,
                  ),
                  // account deletion button
                  Card(
                      child: ListTile(
                    leading: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.deepOrangeAccent,
                    ),
                    title: const Text(
                      "Delete Account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {},
                  )),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ))),
      ],
    );
  }
}
