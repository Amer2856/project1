import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController; // For the NavigationBar
  int selecteditem = 0;
  @override
  void initState() {
    tabController =
        TabController(length: 3 /*Three pages*/, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 20,
        elevation: 0.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 15.0,
          selectedIconTheme: const IconThemeData(size: 28.0),
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
        // HERE WE PUT THE ROUTES
      ]),
    );
  }
}
