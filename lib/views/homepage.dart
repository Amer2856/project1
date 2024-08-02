import 'package:project_one/packages.dart';
import 'myTrips.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
        toolbarHeight: 0,
      ),
      // Navigation bar
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
                icon: Icon(Icons.interests_rounded), label: "My Trips"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "Me")
          ]),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            // First page (recommendations and browsing available trips)
            Tripsview(),
            // Second page (booked trips & favourited trips view)
            Mytrips(),
            // third page (personal)
            Me()
          ]),
    );
  }
}
