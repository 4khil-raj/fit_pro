import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text("Progress", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
