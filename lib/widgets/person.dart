import 'package:flutter/material.dart';

Widget person(Color color) {
// the logo of a person
  return Center(
    child: Container(
      margin: const EdgeInsets.fromLTRB(65, 25, 65, 50),
      padding: const EdgeInsets.all(30),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(150),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(15, 10),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            height: 25,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.vertical(
                    top: Radius.elliptical(100, 50),
                    bottom: Radius.elliptical(100, 20))),
          ),
        ],
      ),
    ),
  );
}
