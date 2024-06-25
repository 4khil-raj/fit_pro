import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/bottom.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/top.dart';
import 'package:fit_pro/presentation/screens/user_info/collect_userinfo.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  bool googleauth = false;
  bool other = false;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(AuthEvent());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: const Color.fromARGB(255, 6, 2, 19),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is SignUpAuthSuccessState) {
              googleauth = state.google;
              other = state.other;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customNavPush(context, const UserInfoCollectingScreen());
              });
              BlocProvider.of<AuthBloc>(context).add(AuthEvent());
            } else if (state is Authenticated) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customNavPush(context, const UserInfoCollectingScreen());
              });
              BlocProvider.of<AuthBloc>(context).add(AuthEvent());
            } else if (state is AuthError) {
              googleauth = false;
              other = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                alerts(context, state.message.toString());
              });
              BlocProvider.of<AuthBloc>(context).add(AuthEvent());
            } else if (state is AuthLoading) {
              googleauth = state.google;
              other = state.other;
            }
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SignupTopScreen(
                    google: googleauth,
                  ),
                  SignUpBottom()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
