import 'package:flutter/material.dart';
import 'package:project_one/controllers/loginpage_controlar.dart';
import 'package:project_one/controllers/tripsview_controlar.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/views/loginpage.dart';

class Tripsview1 extends StatefulWidget {
  const Tripsview1({super.key});

  @override
  State<Tripsview1> createState() => _Tripsview1State();
}

class _Tripsview1State extends State<Tripsview1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 25,
            ),
            GetBuilder<TripsviewControlar>(
                init: TripsviewControlar(),
                builder: (controlar) => Card(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(() => const LoginPage());
                            },
                            icon: const Icon(Icons.login),
                          ),
                          const Expanded(child: SearchTextField()),
                          IconButton(
                            icon: Image.asset(
                              color: const Color.fromARGB(255, 52, 51, 51),
                              'images/sorting_icon.png',
                              scale: 150,
                            ),
                            onPressed: () {
                              // Sorting Options
                            },
                          ),
                        ],
                      ),
                    )),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Filtering",
                  style: TextStyle(color: Colors.deepOrangeAccent),
                )),
            GetBuilder<TripsviewControlar>(
                init: TripsviewControlar(),
                builder: (controlar) => const PageViewWidget()),
            Expanded(
              child: ListView.separated(
                  itemCount: 20,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  padding: EdgeInsets.fromLTRB(
                      0, context.height / 12, context.width / 5, 0),
                  itemBuilder: (context, index) {
                    // List tile of the trip
                    return GetBuilder<TripsviewControlar>(
                        init: TripsviewControlar(),
                        builder: (controlar) => ListTile(
                              title: Text(
                                // Trip's name
                                '${controlar.name}.${index + 1}}',
                                //  "Trip no. ${index + 1}",
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              subtitle: const Text(
                                // Trip's date
                                "welcome to our trip",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                              leading: Image.asset(
                                // Trip's image
                                'images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg',
                              ),
                              onTap: () {
                                // Navigator to the Trip's info
                                //Get.to(() => const tripsinfo())
                              },
                              shape: const OutlineInputBorder(
                                  // The Style of the ListTyle
                                  borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
