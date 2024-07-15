import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/views/me.dart';
import 'package:project_one/views/tripsview1.dart';
import 'package:project_one/views/myTrips.dart';
import 'package:project_one/widgets/tripdetails.dart';

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
