import 'dart:convert';

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
            motion: const ScrollMotion(),
            children: [
              CustomSlidableAction(
                padding: const EdgeInsets.all(0),
                backgroundColor: context.theme.scaffoldBackgroundColor,
                // backgroundColor: context.theme.scaffoldBackgroundColor,
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
                padding: const EdgeInsets.all(0),
                backgroundColor: context.theme.scaffoldBackgroundColor,
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
                child: const Expanded(
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      size: 30,
                    ),
                  ),
                ),
              )
            ]),
        groupTag: SlidableAutoCloseBehavior,
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
            leading: SizedBox(
              width: 75,
              height: 75,
              child: Image.asset(
                fit: BoxFit.fill,
                // Trip's image
                'images/img${index + 1}.jpg',
              ),
            ),
            trailing: const Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(text: "3.4 ", children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.star,
                        size: 14,
                      ))
                    ])),
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
