import 'package:fit_pro/presentation/widgets/form_field/formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupOrSignin extends StatelessWidget {
  SignupOrSignin({super.key});
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FitPro',
              style: GoogleFonts.orbitron(
                  color: const Color.fromARGB(255, 72, 173, 255),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextFormField(hintText: 'Email', controller: emailController)
          ],
        ),
      ),
    ));
  }
}
