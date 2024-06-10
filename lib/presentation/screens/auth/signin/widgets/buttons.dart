import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/domain/models/auth_model.dart/signup_user.dart';
import 'package:fit_pro/presentation/screens/auth/signup/otp_screen/signup_otp.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:fit_pro/presentation/widgets/icon_button/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LogInButtons extends StatelessWidget {
  LogInButtons(
      {super.key,
      required this.signup,
      required this.emailController,
      required this.passwordController,
      required this.social,
      required this.other});
  bool social;
  bool other;
  final bool signup;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: other
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.yellow,
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.inkDrop(
                          // secondRingColor: Colors.green,
                          // thirdRingColor: Colors.blue,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 32)),
                  width: double.infinity,
                  height: 60,
                )
              : CustomButton(
                  fontweight: FontWeight.w600,
                  isNetwork: false,
                  isRow: false,
                  borderclr: Colors.yellow,
                  color: Colors.yellow,
                  height: 60,
                  radius: 9,
                  textclr: const Color.fromRGBO(0, 0, 0, 1),
                  onTap: () {
                    final user = UserModel(
                        email: emailController.text,
                        password: passwordController.text);
                    signup
                        ? BlocProvider.of<AuthBloc>(context)
                            .add(SignUpEvent(user: user))
                        : BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            email: emailController.text,
                            passcode: passwordController.text));
                  },
                  textsize: 16,
                  width: double.infinity,
                  name: signup ? 'Sign Up' : 'LOG IN',
                ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.all(11.0),
              child: Text(
                'or continue with',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(child: Divider())
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 17,
            right: 17,
            top: 5,
          ),
          child: social
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.transparent,
                  ),
                  width: double.infinity,
                  height: 55,
                  child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoadingAnimationWidget.fourRotatingDots(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            size: 36),
                      )),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      onTap: () => BlocProvider.of<AuthBloc>(context)
                          .add(GoogleSigninEvent()),
                      width: MediaQuery.of(context).size.width / 5,
                      radius: 8,
                      imagepadding: 6.7,
                      image: 'assets/icons/google.png',
                      borderclr: Colors.white,
                    ),
                    CustomIconButton(
                      image: 'assets/icons/apple.png',
                      imagepadding: 6.7,
                      borderclr: Colors.white,
                      radius: 8,
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    CustomIconButton(
                      image: 'assets/icons/facebook_logos.png',
                      imagepadding: 2,
                      borderclr: Colors.white,
                      radius: 8,
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                  ],
                ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
