import 'package:project_one/controllers/tripsview_controller.dart';
import 'package:project_one/packages.dart';
import 'package:project_one/widgets/actionsBar.dart';
import '../controllers/actionbar_controller.dart';

class Tripsview extends StatefulWidget {
  const Tripsview({super.key});

  @override
  State<Tripsview> createState() => _TripsviewState();
}

class _TripsviewState extends State<Tripsview> {
  final Bar controller = Get.put(Bar());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GetBuilder<TripsviewController>(
              init: TripsviewController(),
              builder: (controller) => const ActionsBar()),
          GetBuilder<TripsviewController>(
              init: TripsviewController(),
              builder: (controller) => const PageViewWidget()),
          GetBuilder<TripsviewController>(
              init: TripsviewController(),
              builder: (controller) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.separated(
                          itemCount: 3,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            // List tile of the trip
                            return GetBuilder<TripsviewController>(
                                init: TripsviewController(),
                                builder: (controller) => ListItem(
                                      index: index,
                                    ));
                          }),
                    ),
                  ))
        ],
      ),
    );
  }
}
