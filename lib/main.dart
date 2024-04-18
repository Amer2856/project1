import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'LeoSphere', //the title of the app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'LeoSphare'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Welcome Page"),
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person),
                Expanded(
                    child: ListTile(
                  title: Text("Amerhelal"),
                  subtitle: Text("amerhelal281@gmail.com"),
                ))
              ],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("homepage"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Account"),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("about us"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("contact us"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("signout"),
            )
          ],
        ),
      ),
    );
  }
}
