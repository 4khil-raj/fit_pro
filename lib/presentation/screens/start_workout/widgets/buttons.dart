import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TickButtonForLateralBurpee extends StatefulWidget {
  const TickButtonForLateralBurpee({super.key});

  @override
  State<TickButtonForLateralBurpee> createState() =>
      _TickButtonForLateralBurpeeState();
}

class _TickButtonForLateralBurpeeState
    extends State<TickButtonForLateralBurpee> {
  bool button = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => setState(() {
              button = !button;
            }),
        child: button
            ? Container(
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 35, 35, 35)),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 70,
                ),
              )
            : const RestNowTimeButtonForLateralBurpee());
  }
}

class RestNowTimeButtonForLateralBurpee extends StatefulWidget {
  const RestNowTimeButtonForLateralBurpee({super.key});

  @override
  State<RestNowTimeButtonForLateralBurpee> createState() =>
      _RestNowTimeButtonForLateralBurpeeState();
}

class _RestNowTimeButtonForLateralBurpeeState
    extends State<RestNowTimeButtonForLateralBurpee> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(0.4),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset Now",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "01:43",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
        Expanded(
            child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 70, 69, 69).withOpacity(0.4),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                    // Text(
                    //   "",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 17,
                    //       fontWeight: FontWeight.w700),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
