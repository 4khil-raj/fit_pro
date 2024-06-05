import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/auth/signup/signup.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/policy.dart';
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
            onTap: () => customNavPush(
                context,
                SignupOrSignin(
                  signup: true,
                )),
            textsize: 16,
            width: double.infinity,
            name: 'Continue with Email',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const AuthPrivacyPolicy()
      ],
    );
  }
}
