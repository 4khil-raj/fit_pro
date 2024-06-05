import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/signup/signup.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupTopScreen extends StatelessWidget {
  const SignupTopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'FitPro',
        style: GoogleFonts.orbitron(
            color: const Color.fromARGB(255, 72, 173, 255),
            fontSize: 50,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 30,
      ),
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: CustomButton(
          iconradius: 15,
          image: 'assets/icons/google.png',
          fontweight: FontWeight.w600,
          isNetwork: false,
          isRow: true,
          borderclr: Colors.white,
          color: Colors.transparent,
          height: 65,
          radius: 9,
          textclr: Colors.white,
          onTap: () =>
              BlocProvider.of<AuthBloc>(context).add(GoogleSigninEvent()),
          textsize: 16,
          width: double.infinity,
          name: 'Continue with Google    ',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: CustomButton(
          iconradius: 21,
          image: 'assets/icons/facebook_logos.png',
          fontweight: FontWeight.w600,
          isNetwork: false,
          isRow: true,
          borderclr: Colors.white,
          color: Colors.transparent,
          height: 65,
          radius: 9,
          textclr: Colors.white,
          onTap: () {},
          textsize: 16,
          width: double.infinity,
          name: 'Continue with FaceBook',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: CustomButton(
          iconradius: 20,
          image: 'assets/icons/apple.png',
          fontweight: FontWeight.w600,
          isNetwork: false,
          isRow: true,
          borderclr: Colors.white,
          color: Colors.transparent,
          height: 65,
          radius: 9,
          textclr: Colors.white,
          onTap: () => customNavPush(context, const SignUpScreen()),
          textsize: 16,
          width: double.infinity,
          name: 'Continue with Apple       ',
        ),
      ),
      SizedBox(
        height: 19,
      ),
    ]);
  }
}
