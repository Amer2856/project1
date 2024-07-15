import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/widgets/person.dart';
import '../packages.dart';

class Me extends StatefulWidget {
  Me({super.key});

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width / 12),
          child: SingleChildScrollView(
              child: Card(
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            child: Column(
              children: [
                //person(Colors.deepOrangeAccent),
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                      "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
                  // child: Image.asset(
                  //     "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg")
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () {}, child: const Text("...")),
                const SizedBox(
                  height: 2,
                ),
                TextButton(onPressed: () {}, child: const Text("09876654")),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Colors.deepOrangeAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                      SizedBox(
                        width: context.width / 2.3,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.deepOrangeAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Delete Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                      SizedBox(
                        width: context.width / 3,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ))),
    );
  }
}
