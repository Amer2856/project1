import 'package:project_one/packages.dart';

void main() {
  runApp(GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(colorSchemeSeed: Colors.deepOrangeAccent),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepOrangeAccent,
      ),
      debugShowCheckedModeBanner: false,
      title: 'LeoSphere', //the title of the app
      home: const HomePage()));
}
