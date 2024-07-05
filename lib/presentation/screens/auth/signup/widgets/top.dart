import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/forget_password/forget.dart';
import 'package:fit_pro/presentation/screens/auth/signup/signup.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignupTopScreen extends StatelessWidget {
  SignupTopScreen({super.key, required this.google});
  bool google;

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
        child: google
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.transparent,
                ),
                width: double.infinity,
                height: 65,
                child: Align(
                    alignment: Alignment.center,
                    child: LoadingAnimationWidget.discreteCircle(
                        secondRingColor: Colors.green,
                        thirdRingColor: Colors.blue,
                        color: Colors.red,
                        size: 32)),
              )
            : CustomButton(
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
          image: 'assets/images/phone.png',
          fontweight: FontWeight.w600,
          isNetwork: false,
          isRow: true,
          borderclr: Colors.white,
          color: Colors.transparent,
          height: 65,
          radius: 9,
          textclr: Colors.white,
          onTap: () => forgetPassword(context, false),
          textsize: 16,
          width: double.infinity,
          name: 'Continue with Phone   ',
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(13.0),
        child: CustomButton(
          iconradius: 20,
          image: 'assets/icons/facebook_logos.png',
          fontweight: FontWeight.w600,
          isNetwork: false,
          isRow: true,
          borderclr: Colors.white,
          color: Colors.transparent,
          height: 65,
          radius: 9,
          textclr: Colors.white,
          onTap: () =>
              BlocProvider.of<AuthBloc>(context).add(FacebookAuthRequstEvent()),
          textsize: 16,
          width: double.infinity,
          name: 'Continue with FaceBook       ',
        ),
      ),
      // SizedBox(
      //   height: 19,
      // ),
      // Padding(
      //   padding: const EdgeInsets.all(13.0),
      //   child: CustomButton(
      //     iconradius: 20,
      //     image: 'assets/icons/apple.png',
      //     fontweight: FontWeight.w600,
      //     isNetwork: false,
      //     isRow: true,
      //     borderclr: Colors.white,
      //     color: Colors.transparent,
      //     height: 65,
      //     radius: 9,
      //     textclr: Colors.white,
      //     onTap: () => customNavPush(context, SignUpScreen()),
      //     textsize: 16,
      //     width: double.infinity,
      //     name: 'Continue with Apple       ',
      //   ),
      // ),
      SizedBox(
        height: 19,
      ),
    ]);
  }
}
