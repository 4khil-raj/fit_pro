import 'package:fit_pro/presentation/screens/user_info/gender/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelectScreen extends StatelessWidget {
  const GenderSelectScreen({super.key});
  final double progressValue = .1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Let\'s get started',
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
            Text('with basics',
                style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 70,
            ),
            const CustomGenderButtons()
          ],
        ),
      ),
    );
  }
}
