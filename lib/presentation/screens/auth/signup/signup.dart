import 'package:fit_pro/presentation/screens/auth/signup/widgets/bottom.dart';
import 'package:fit_pro/presentation/screens/auth/signup/widgets/top.dart';
import 'package:flutter/material.dart';

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
        body: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SignupTopScreen(), SignUpBottom()],
          ),
        ),
      ),
    );
  }
}
