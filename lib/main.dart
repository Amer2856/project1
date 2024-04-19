import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LeoSphere', //the title of the app
      home: MyHomePage(title: 'LeoSphare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController; // For the NavigationBar
  int selecteditem = 0;
  @override
  void initState() {
    tabController = TabController(length: 3 /*Three pages*/, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorEffect.neutralValue,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 20,
        elevation: 0.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 15.0,
          selectedItemColor: ColorEffect.neutralValue,
          selectedIconTheme: IconThemeData(size: 28.0),
          currentIndex: selecteditem,
          onTap: (value) {
            setState(() {
              selecteditem = value;
              tabController!.animateTo(selecteditem);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.interests_rounded), label: "Suggestions"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "Me")
          ]),
      body: TabBarView(controller: tabController, children: const [
        Text("data"),
        Text("data"),
        Text("data")
        // HERE WE PUT THE ROUTES
      ]),
    );
  }
}

// Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               MaterialButton(
//                 onPressed: () {},
//                 child: const Row(
//                   children: [
//                     Icon(Icons.person),
//                     Expanded(
//                         child: ListTile(
//                       title: Text("Amerhelal"),
//                       subtitle: Text("amerhelal281@gmail.com"),
//                     ))
//                   ],
//                 ),
//               ),
//               const ListTile(
//                 leading: Icon(Icons.home),
//                 title: Text("homepage"),
//               ),
//               const ListTile(
//                 leading: Icon(Icons.account_box),
//                 title: Text("Account"),
//               ),
//               const ListTile(
//                 leading: Icon(Icons.help),
//                 title: Text("about us"),
//               ),
//               const ListTile(
//                 leading: Icon(Icons.phone),
//                 title: Text("contact us"),
//               ),
//               const ListTile(
//                 leading: Icon(Icons.exit_to_app),
//                 title: Text("signout"),
//               )
//             ],
//           ),
