import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';

class Mytrips extends StatefulWidget {
  const Mytrips({super.key});

  @override
  State<Mytrips> createState() => _MytripsState();
}

class _MytripsState extends State<Mytrips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),

                Row(children: [
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                              height: 120,
                              width: 200,
                              child: Image.asset(
                                "images/img3.jpg",
                                fit: BoxFit.cover,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Booked Trips")),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 155,
                  )
                ]),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  const SizedBox(
                    width: 155,
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 200,
                            child: Image.asset(
                              "images/img4.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Favourited Trips")),
                        ],
                      ),
                    ),
                  ),
                ]),

                // Padding(
                //     padding: EdgeInsets.all(20),
                //     child: SingleChildScrollView(
                //       // margin: const EdgeInsets.only(top: 100, bottom: 100),
                //       child: Center(
                //         child: Column(
                //           children: [
                //             const Text(
                //               "Hi, Did you want to see your trips?",
                //               style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.deepOrangeAccent,
                //                   fontSize: 15),
                //             ),
                //             SizedBox(
                //               height: 5,
                //             ),
                //             Card(
                //                 margin: const EdgeInsets.only(
                //                     top: 100, right: 20, left: 20),
                //                 child: Column(children: [
                //                   const SizedBox(height: 40),
                //                   Padding(
                //                     padding: const EdgeInsets.only(right: 80, left: 10),
                //                   ),
                //                   Row(
                //                     children: [
                //                       Expanded(
                //                         child: Column(
                //                           children: [
                //                             Image.asset(
                //                                 "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
                //                             TextButton(
                //                                 onPressed: () {},
                //                                 child: const Text("Booked Trips")),
                //                           ],
                //                         ),
                //                       ),
                //                       const SizedBox(
                //                         width: 8,
                //                       ),
                //                       Expanded(
                //                         child: Column(
                //                           children: [
                //                             Image.asset(
                //                                 "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
                //                             TextButton(
                //                                 onPressed: () {},
                //                                 child: const Text("Saved Trips")),
                //                           ],
                //                         ),
                //                       )
                //                     ],
                //                   )
                //                 ]))
                //           ],
                //         ),
                //       ),
                //     ))
              ],
            ),
          ),
        ));
  }
}
