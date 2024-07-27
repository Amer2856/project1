import 'package:project_one/main.dart';
import 'package:project_one/packages.dart';
import 'package:image_picker/image_picker.dart';

class Me extends StatefulWidget {
  const Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

bool darktheme = false;

class _MeState extends State<Me> {
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
                        value: darktheme,
                        onChanged: (val) {
                          setState(() {
                            darktheme = val;
                          });
                        }),
                    onTap: () {
                      setState(() {
                        darktheme = !darktheme;
                      });
                    },
                  )),
                  const SizedBox(
                    height: 20,
                  ),
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
