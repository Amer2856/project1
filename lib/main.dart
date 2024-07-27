import 'package:project_one/packages.dart';

GlobalKey appkey = GlobalKey();
void main() {
  runApp(GetMaterialApp(
      key: appkey,
      themeMode: (darktheme) ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(colorSchemeSeed: Colors.deepOrangeAccent),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.deepOrangeAccent,
      ),
      debugShowCheckedModeBanner: false,
      title: 'LeoSphere', //the title of the app
      home: const HomePage()));
}
