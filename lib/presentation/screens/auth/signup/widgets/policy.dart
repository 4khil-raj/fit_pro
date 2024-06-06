import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPrivacyPolicy extends StatelessWidget {
  const AuthPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'By continuing forward, you agree to FitPro’s',
          style: GoogleFonts.roboto(fontSize: 15, color: Colors.white54),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Privacy Policy',
                style: TextStyle(
                    decorationColor: Color.fromARGB(255, 98, 179, 245),
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
            //
            const Text('And', style: TextStyle(color: Colors.white54)),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Terms & Conditions',
                style: TextStyle(
                    decorationColor: Color.fromARGB(255, 98, 179, 245),
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        )
      ],
    );
  }
}
