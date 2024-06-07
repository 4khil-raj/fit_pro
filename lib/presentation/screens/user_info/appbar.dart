import 'package:flutter/material.dart';

class UserInfoAppBar extends StatelessWidget {
  const UserInfoAppBar({super.key, required this.progressValue});
  final double progressValue;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: LinearProgressIndicator(
        value: progressValue,
        backgroundColor: Colors.grey,
        valueColor: const AlwaysStoppedAnimation<Color>(
            Color.fromARGB(255, 72, 173, 255)),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(
              decorationColor: Color.fromARGB(255, 98, 179, 245),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
