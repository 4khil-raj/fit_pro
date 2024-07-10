// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class KgorlbcontainerWidget extends StatelessWidget {
  const KgorlbcontainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: const Color.fromARGB(255, 33, 208, 243)),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "KG",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
        ),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30)),
            border: Border.all(color: const Color.fromARGB(255, 33, 208, 243)),
          ),
          // color: const Color.fromARGB(255, 33, 208, 243)),
          child: const Align(
              alignment: Alignment.center,
              child: Text("LB",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
        )
      ],
    );
  }
}

class KgorLbcontainerWidget2 extends StatelessWidget {
  const KgorLbcontainerWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            border: Border.all(color: const Color.fromARGB(255, 33, 208, 243)),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "KG",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30)),
              color: const Color.fromARGB(255, 33, 208, 243)),
          // color: const Color.fromARGB(255, 33, 208, 243)),
          child: const Align(
              alignment: Alignment.center,
              child: Text("LB",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        )
      ],
    );
  }
}
