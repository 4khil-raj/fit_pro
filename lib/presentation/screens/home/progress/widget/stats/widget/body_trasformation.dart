import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTrasformationWidgetProgressScreen extends StatelessWidget {
  const BodyTrasformationWidgetProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Body Trasformation",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "+ Add Photo",
                  style: TextStyle(color: Color.fromARGB(255, 80, 172, 248)),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            height: 170,
            width: double.infinity,
            child: Image.network(
                fit: BoxFit.cover,
                "https://strengthbuzz.com/wp-content/uploads/2020/01/Push-Up-Workout.jpg"),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
