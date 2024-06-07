import 'package:flutter/material.dart';

class FinishBackground extends StatelessWidget {
  const FinishBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 7, 2, 22),
          image: DecorationImage(
              opacity: 0.5,
              image: AssetImage(
                'assets/images/WhatsApp Image 2024-06-07 at 10.02.47 PM.jpeg',
              ),
              fit: BoxFit.cover)),
    );
  }
}
