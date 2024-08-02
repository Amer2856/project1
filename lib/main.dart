import 'package:project_one/controllers/homepagecontroller.dart';
import 'package:project_one/packages.dart';

void main() {
  runApp(MyApp());
}

final Homepagecontroller controller = Get.put(Homepagecontroller());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return
        // Obx(() {
        //   return
        GetMaterialApp(
            themeMode: ThemeMode.light,
            theme: ThemeData(colorSchemeSeed: Colors.deepOrangeAccent),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorSchemeSeed: Colors.deepOrangeAccent,
            ),
            debugShowCheckedModeBanner: false,
            title: 'LeoSphere', //the title of the app
            home: const HomePage());
    // })
    ;
  }
}
