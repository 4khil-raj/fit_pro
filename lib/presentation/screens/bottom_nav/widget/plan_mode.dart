import 'package:flutter/material.dart';

class PlanModeButton extends StatelessWidget {
  const PlanModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.circle,
          image: const DecorationImage(
            image:
                AssetImage("assets/images/IMG_7399-removebg-preview (1).png"),
          ),
        ),
        height: 75,
        width: 85,
      ),
    );
  }
}
