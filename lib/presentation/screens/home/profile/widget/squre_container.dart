// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSqureContainer extends StatelessWidget {
  const ProfileSqureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 53, 53, 53),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 64, 78),
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "12k",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Spacer(),
                              FaIcon(
                                FontAwesomeIcons.clock,
                                color: Color.fromARGB(255, 85, 177, 252),
                                size: 23.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Total Hours",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 64, 78),
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    child: const Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "04",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Spacer(),
                              FaIcon(
                                FontAwesomeIcons.dumbbell,
                                color: Color.fromARGB(255, 85, 177, 252),
                                size: 23.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "# of Plans",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 47, 64, 78),
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "102k",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Spacer(),
                              FaIcon(
                                FontAwesomeIcons.fire,
                                color: Color.fromARGB(255, 85, 177, 252),
                                size: 23.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Calories Burned",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 47, 64, 78),
                        borderRadius: BorderRadius.circular(10)),
                    height: 100,
                    child: const Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "25",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Spacer(),
                              FaIcon(
                                FontAwesomeIcons.circleCheck,
                                color: Color.fromARGB(255, 85, 177, 252),
                                size: 23.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "# of Workouts",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
