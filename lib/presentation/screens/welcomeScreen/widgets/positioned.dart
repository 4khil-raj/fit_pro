import 'package:fit_pro/presentation/screens/auth/signin/signin.dart';
import 'package:fit_pro/presentation/screens/auth/signup/signup.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'FitPro',
            style: GoogleFonts.orbitron(
                color: const Color.fromARGB(255, 72, 173, 255),
                fontSize: 50,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Welcome to FitPro',
            style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              'Where Every Breath Counts – Empowering You to Breathe Easy',
              style: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
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
              name: 'SIGN UP',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: CustomButton(
              fontweight: FontWeight.w600,
              isNetwork: false,
              isRow: false,
              borderclr: Colors.blue,
              color: Colors.transparent,
              height: 60,
              radius: 9,
              textclr: const Color.fromARGB(255, 39, 153, 247),
              onTap: () => customNavPush(context, SignupOrSignin()),
              textsize: 17,
              width: double.infinity,
              name: 'Log In',
            ),
          ),
          const SizedBox(
            height: 23,
          )
        ],
      ),
    );
  }
}
