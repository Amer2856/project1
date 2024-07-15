import 'package:flutter/material.dart';
import 'package:project_one/packages.dart';

class Tripdetails extends StatefulWidget {
  const Tripdetails({super.key});

  @override
  State<Tripdetails> createState() => _TripdetailsState();
}

class _TripdetailsState extends State<Tripdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
                "images/travel-traveling-logo-tour-and-travel-logo-design-vector.jpg"),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Get.to(Details());
                },
                child: const Text(
                  "Show details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                      fontSize: 20),
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 60,
                width: 100,
                child: const Text(
                  "Book",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
