// ignore_for_file: must_be_immutable

import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/application/login_bloc/login_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/signin/widgets/buttons.dart';
import 'package:fit_pro/presentation/screens/auth/signin/widgets/remember_me.dart';
import 'package:fit_pro/presentation/screens/auth/signin/widgets/text_fields.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/policy.dart';
import 'package:fit_pro/presentation/screens/tempHome/tempHome.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupOrSignin extends StatelessWidget {
  SignupOrSignin({super.key, required this.signup});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberme = false;
  bool obsecure = false;
  bool signup;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 6, 2, 19),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: SingleChildScrollView(child:
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              if (state is RemembermeState) {
                rememberme = state.rememberme;
              } else if (state is ObsecureTextState) {
                obsecure = state.obsecureText;
              } else if (state is SignUpAuthSuccessState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customNavRemoveuntil(context, const TempHome());
                });
              } else if (state is Authenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  customNavRemoveuntil(context, const TempHome());
                });
              } else if (state is AuthError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  alerts(context, state.message.toString());
                });
              }
              return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        const SizedBox(
                          height: 11,
                        ),
                        LoginFields(
                          obsecure: obsecure,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        RememberMeLogIn(
                          remember: rememberme,
                        ),
                        LogInButtons(
                          emailController: emailController,
                          passwordController: passwordController,
                          signup: signup,
                        ),
                        const AuthPrivacyPolicy()
                      ])));
            }))));
  }
}
