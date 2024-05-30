import 'package:fit_pro/presentation/screens/signup/signup.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpBottom extends StatelessWidget {
  const SignUpBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.all(11.0),
              child: Text(
                'OR',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(child: Divider())
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: CustomButton(
            fontweight: FontWeight.w600,
            isNetwork: false,
            isRow: false,
            borderclr: Colors.yellow,
            color: Colors.yellow,
            height: 60,
            radius: 9,
            textclr: Colors.black,
            onTap: () => customNavPush(context, const SignUpScreen()),
            textsize: 16,
            width: double.infinity,
            name: 'Continue with Email',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
