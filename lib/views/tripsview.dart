import 'package:project_one/packages.dart';

class TripsViewPage extends StatefulWidget {
  const TripsViewPage({super.key});

  @override
  State<TripsViewPage> createState() => _TripsViewPageState();
}

class _TripsViewPageState extends State<TripsViewPage> {
  @override
  Widget build(context) {
    return Stack(
      children: [
        // List generator
        ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            padding: EdgeInsets.fromLTRB(
                0, context.height / 12, context.width / 5, 0),
            itemBuilder: (context, index) {
              // List tile of the trip
              return ListTile(
                title: Text(
                  // Trip's name
                  "Trip no. ${index + 1}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                subtitle: const Text(
                  // Trip's date
                  "welcome to our trip",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                leading: Image.asset(
                  // Trip's image
                  'images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg',
                ),
                onTap: () {
                  // Navigator to the Trip's info
                },
                shape: const OutlineInputBorder(
                    // The Style of the ListTyle
                    borderSide:
                        BorderSide(color: Colors.deepPurpleAccent, width: 2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              );
            }),
        // Floating Bar
        Container(
            margin: EdgeInsets.symmetric(horizontal: context.width / 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Actions Bar
                Card(
                  elevation: 5,
                  shadowColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Builder(builder: (context0) {
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
                    // Row(children: [
                    //   IconButton(
                    //         icon: Image.asset(
                    //           color: Colors.white70,
                    //           'images/sorting_icon.png',
                    //           scale: 150,
                    //         ),
                    //         onPressed: () {
                    //           // Sorting Options
                    //         },
                    //       ),
                    //   IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.sort_by_alpha)),
                    //   IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.timelapse)),
                    //   IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.date_range)),
                    // ])
                  }),
                ),
                // Filtering Button
                ElevatedButton(onPressed: () {}, child: const Text("Filtering"))
              ],
            ))
      ],
    );
  }
}
