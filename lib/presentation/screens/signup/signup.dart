// ignore_for_file: prefer_const_constructors

import 'package:fit_pro/presentation/screens/signup/widgets/bottom.dart';
import 'package:fit_pro/presentation/screens/signup/widgets/top.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color.fromARGB(255, 6, 2, 19),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [SignupTopScreen(), SignUpBottom()],
          ),
        ),
      ),
    );
  }
}
