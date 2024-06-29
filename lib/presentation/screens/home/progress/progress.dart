// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fit_pro/presentation/screens/home/progress/widget/stats/stats.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 6, 2, 19),
          title: Text("Progress",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, color: Colors.white)),
          bottom: TabBar(
            indicatorColor: Colors.blue,
            labelColor: const Color.fromARGB(255, 88, 177, 249),
            dividerColor: Colors.white30,
            unselectedLabelColor: Color.fromARGB(255, 192, 180, 180),
            tabs: [
              Tab(text: "    Stats    "),
              Tab(text: " Plan Progress "),
              Tab(text: " Calender "),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StatsScreenProgress(),
            Center(
                child: Text("Content for Tab 2",
                    style: TextStyle(color: Colors.white))),
            Center(
                child: Text("Content for Tab 3",
                    style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
