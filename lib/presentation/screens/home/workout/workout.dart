import 'package:flutter/material.dart';

class WorkOutScreen extends StatelessWidget {
  const WorkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text(
          'Workouts',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(),
    );
  }
}
