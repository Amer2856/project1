import 'package:project_one/packages.dart';
import 'package:project_one/widgets/actionsBar.dart';

class TripsViewPage extends StatefulWidget {
  const TripsViewPage({super.key});
  @override
  State<TripsViewPage> createState() => _TripsViewPageState();
}

class _TripsViewPageState extends State<TripsViewPage> {
  @override
  Widget build(context) {
    return Stack(
      children: [
        // List generator
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 60,
              ),
              // HERE IS THE PAGE VIEW
              const PageViewWidget(),
              ...List.generate(5, (index) {
                return ListItem(index: index);
              })
            ],
          ),
        ),
        const ActionsBar()
      ],
    );
  }
}
