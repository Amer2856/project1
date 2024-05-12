import 'package:project_one/packages.dart';

class Dropdownlist {
  late String title;
  late List<SelectedListItem> list;
  late BuildContext context;
  Dropdownlist(title, list, context) {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: list ?? [],
        selectedItems: (List<dynamic> selectedList) {
          print(selectedList.indexed);
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          showSnackBar(list.toString(), context);
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
