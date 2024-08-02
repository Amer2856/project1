import 'package:flutter/cupertino.dart';
import 'package:project_one/controllers/actionbar_controller.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/widgets/form.dart';

class ActionsBar extends StatefulWidget {
  const ActionsBar({super.key});
  @override
  State<ActionsBar> createState() => _ActionsBarState();
}

final Bar controller = Get.put(Bar());

class _ActionsBarState extends State<ActionsBar> {
  RangeValues? _costRange;
  RangeValues? _tripDuration;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.width / 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Actions Bar
            Card(
                margin: EdgeInsets.symmetric(horizontal: context.width / 12),
                elevation: 2,
                shadowColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(() => controller.v.value)),
            // Filtering Button
            ElevatedButton(
                onPressed: () {
                  Get.generalDialog(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FormDialog();
                    },
                  );
                },
                child: const Text("Filtering"))
          ],
        ));
  }
}

class ActionsOptions extends StatefulWidget {
  const ActionsOptions({super.key});

  @override
  State<ActionsOptions> createState() => _ActionsOptionsState();
}

class _ActionsOptionsState extends State<ActionsOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      // Login Button
      IconButton(
        onPressed: () {
          Get.to(() => LoginPage());
        },
        icon: const Icon(Icons.login),
      ),
      // Search Field
      const Expanded(child: SearchTextField()),
      // Sorting button
      IconButton(
        icon: ImageIcon(Image.asset('images/sorting_icon.png').image),
        onPressed: () {
          controller.change();
        },
      )
    ]);
  }
}

class SortingOptions extends StatefulWidget {
  const SortingOptions({super.key});

  @override
  State<SortingOptions> createState() => _SortingOptionsState();
}

class _SortingOptionsState extends State<SortingOptions> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        icon: ImageIcon(Image.asset('images/sorting_icon.png').image),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.alarm),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.attach_money),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.sort_by_alpha),
        onPressed: () {},
      ),
      IconButton(
          onPressed: () {
            controller.change();
          },
          icon: const Icon(Icons.check))
    ]);
  }
}
