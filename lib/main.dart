import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(colorSchemeSeed: Colors.deepOrangeAccent),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorSchemeSeed: Colors.deepOrangeAccent,
        ),
        debugShowCheckedModeBanner: false,
        title: 'LeoSphere', //the title of the app
        home: const HomePage());
  }
}
