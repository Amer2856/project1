import '../packages.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatefulWidget {
  final int index;
  const ListItem({super.key, required this.index});
  @override
  State<ListItem> createState() => _ListItemState(index);
}

class _ListItemState extends State<ListItem> {
  final int index;

  _ListItemState(this.index);
  @override
  Widget build(BuildContext context) {
    return Slidable(
        closeOnScroll: true,
        // Specify a key if the Slidable is dismissible.
        key: ValueKey(index),
        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const BehindMotion(),
          children: [
            CustomSlidableAction(
              autoClose: true,
              onPressed: (context) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Trip Saved'),
                  ),
                );
              },
              foregroundColor: Colors.deepOrangeAccent,
              child: const Icon(Icons.favorite, size: 30),
            ),
            CustomSlidableAction(
              padding: EdgeInsets.all(10),
              autoClose: true,
              onPressed: (context) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Trip Booked'),
                  ),
                );
              },
              foregroundColor: const Color(0xFF0392CF),
              child: const Icon(
                Icons.check_circle,
                size: 30,
              ),
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: Card(
          child: ListTile(
            minLeadingWidth: context.width / 4.5,
            title: Text(
              // Trip's name
              "Trip no. ${index + 1}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            subtitle: const Text(
              // Trip's date
              "welcome to our trip",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            leading: Image.asset(
              // Trip's image
              'images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg',
            ),
            trailing: const Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "3.4",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text("0.5 \$")
                  ]),
            ),
            onTap: () {
              // Navigator to the Trip's info
            },
          ),
        ));
  }
}
