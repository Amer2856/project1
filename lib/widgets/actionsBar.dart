import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:project_one/packages.dart';

class ActionsBar extends StatefulWidget {
  const ActionsBar({super.key});
  @override
  State<ActionsBar> createState() => _ActionsBarState();
}

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
              clipBehavior: Clip.none,
              elevation: 2,
              shadowColor: Colors.deepOrangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Login Button
                IconButton(
                  onPressed: () {
                    Get.to(() => const LoginPage());
                  },
                  icon: const Icon(Icons.login),
                ),
                // Search Field
                const Expanded(child: SearchTextField()),
                // Sorting button
                PopupMenuButton(
                    offset: Offset.fromDirection(0),
                    icon:
                        ImageIcon(Image.asset('images/sorting_icon.png').image),
                    itemBuilder: (context) => [
                          const PopupMenuItem(child: Icon(Icons.alarm)),
                          const PopupMenuItem(
                            value: "By Cost",
                            child: Icon(Icons.attach_money),
                          ),
                          const PopupMenuItem(child: Icon(Icons.star_rate)),
                        ])
              ]),
            ),
            // Filtering Button
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                            child: SizedBox(
                              height: context.height * 0.5,
                              width: context.width * 0.75,
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Trip Type DropDownList
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CupertinoButton(
                                            onPressed: () {
                                              Dropdownlist(
                                                  "Trip Type", types, context);
                                            },
                                            child: const Text("TripType")),
                                        // Destination discription DropDownList
                                        CupertinoButton(
                                            onPressed: () {
                                              Dropdownlist(
                                                  "env", categories, context);
                                            },
                                            child: const Text("Environment")),
                                      ],
                                    ),
                                    // Cost Range Slider
                                    const Text('Cost Range:'),
                                    RangeSlider(
                                      values: _costRange ??
                                          const RangeValues(0, 1000),
                                      min: 0,
                                      max: 1000,
                                      divisions: 10,
                                      labels: _costRange != null
                                          ? RangeLabels(
                                              '${_costRange!.start.round()}',
                                              '${_costRange!.end.round()}')
                                          : null,
                                      onChanged: (range) =>
                                          setState(() => _costRange = range),
                                    ),
                                    // Trip Duration Dropdown
                                    const Text('Trip Duration :'),
                                    RangeSlider(
                                      values: _tripDuration ??
                                          const RangeValues(1, 4),
                                      min: 1,
                                      max: 4,
                                      divisions: 3,
                                      labels: _tripDuration != null
                                          ? RangeLabels(
                                              _tripDuration!.start.round() == 1
                                                  ? '${_tripDuration!.start.round()} day'
                                                  : '${_tripDuration!.start.round()} days',
                                              '${_tripDuration!.end.round() == 4 ? "Up to 3 days" : _tripDuration!.end.round()}')
                                          : null,
                                      onChanged: (range) =>
                                          setState(() => _tripDuration = range),
                                    ),
                                    // Submit Button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(width: 100),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Submit'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: const Text("Filtering"))
          ],
        ));
  }
}
