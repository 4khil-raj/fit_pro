import 'package:fit_pro/application/auth_bloc/auth_bloc.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/bottom.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/top.dart';
import 'package:fit_pro/presentation/screens/user_info/collect_userinfo.dart';
import 'package:fit_pro/presentation/widgets/alerts/alerts.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customNavPush(context, const UserInfoCollectingScreen());
              });
            } else if (state is Authenticated) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customNavPush(context, const UserInfoCollectingScreen());
              });
            } else if (state is AuthError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                alerts(context, state.message.toString());
              });
            }
            return const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SignupTopScreen(), SignUpBottom()],
              ),
            );
          },
        ),
      ),
    );
  }
}
