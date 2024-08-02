import 'package:project_one/packages.dart';
import 'package:project_one/widgets/actionsBar.dart';

class Bar extends GetxController {
  var v = (ActionsOptions() as Widget).obs;
  void change() {
    if (v.value is ActionsOptions) {
      v.value = SortingOptions() as Widget;
    } else {
      v.value = const ActionsOptions();
    }
  }
}
